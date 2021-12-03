
class NoveltiesController < ApplicationController
  before_action :authenticate_user!
  def index
    @novelties = Novelty.where(employee_id: current_user.employee.id)
  end
  def new
    @novelty = Novelty.new
  end

  def all_novelties
    @date_greater_than = "01/#{params["greater_date(2i)"]}/#{params["greater_date(1i)"]}"
    @date_less_than = "01/#{params["less_date(2i)"]}/#{params["less_date(1i)"]}"
    @novelties = Novelty.where('date BETWEEN (?) AND (?)', @date_less_than.to_date, @date_greater_than.to_date.end_of_month).order(:date)
  end

  def novelties_by_dependency
    @date_greater_than = "01/#{params["greater_date(2i)"]}/#{params["greater_date(1i)"]}"
    @date_less_than = "01/#{params["less_date(2i)"]}/#{params["less_date(1i)"]}"
    @novelties = Novelty.where('date BETWEEN (?) AND (?)', @date_less_than.to_date, @date_greater_than.to_date.end_of_month).includes(:employee => [:held_position, :dependency]).order( 'dependencies.name_dependency','held_positions.name_position')
  end

  def novelties_by_employee
    @date_greater_than = "01/#{params["greater_date(2i)"]}/#{params["greater_date(1i)"]}"
    @date_less_than = "01/#{params["less_date(2i)"]}/#{params["less_date(1i)"]}"
    @novelties = Novelty.where('date BETWEEN (?) AND (?)', @date_less_than.to_date, @date_greater_than.to_date.end_of_month).where(employee_id: params[:employee_id].to_i)
    if params[:employee_id].present?
      @employee = Employee.find(params[:employee_id])
      if @employee.join_date > @date_less_than.to_date
        @worked_months = ((@employee.join_date..@date_greater_than.to_date.end_of_month).count/30)
      else
        @worked_months = ((@date_less_than.to_date..@date_greater_than.to_date.end_of_month).count/30)
      end
    end

  end

  def create
    @novelty = Novelty.new(novelties_params)
    @novelty.employee_id = current_user.employee.id
    if @novelty.save
      @novelty.update(date: Date.today)
      if @novelty.is_vacations?
        vacations_days = params[:novelty][:vacations_end_date].to_date.day - params[:novelty][:vacations_start_date].to_date.day
        @novelty.update(vacations_days: vacations_days)
      elsif @novelty.is_inability?
        inability_days = params[:novelty][:disability_end_date].to_date.day - params[:novelty][:disability_start_date].to_date.day
        @novelty.update(disabilty_days: inability_days)
      end
      flash[:notice] = 'Se ha creado la novedad con exito'
      redirect_to novelties_path
    else
      flash[:notice] = "No se crear la novedad: #{@novelty.errors.full_messages.join(', ')}"
      render :new
    end
  end

  
  private
  def novelties_params
    params.require(:novelty).permit( :work_days, :vacations_start_date,:vacations_end_date, :vacations_days, :bonus, :transport, :novelty_type, :disability_start_date, :disability_end_date)
  end
end