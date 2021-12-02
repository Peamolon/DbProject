class NoveltiesController < ApplicationController

  def index
    @novelties = Novelty.where(employee_id: current_user.employee.id)
  end
  def new
    @novelty = Novelty.new
  end

  def create
    @novelty = Novelty.new(novelties_params)
    @novelty.employee_id = current_user.employee.id
    if @novelty.is_vacations?
      vacations_days = params[:novelty][:vacations_end_date].to_date.day - params[:novelty][:vacations_start_date].to_date.day
      @novelty.vacations_days = vacations_days
    elsif @novelty.is_inability?
      inability_days = params[:novelty][:disability_end_date].to_date.day - params[:novelty][:disability_start_date].to_date.day
      @novelty.disabilty_days = inability_days
    end
    if @novelty.save
      @novelty.update(date: Date.today)
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