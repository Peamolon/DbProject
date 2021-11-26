class EmployeesController < ApplicationController
  before_action :set_employee, only: %i[ show edit update destroy ]


  # GET /employees or /employees.json
  def index
    @way = params[:order]
    if @way == "ASC" || @way.blank?
      @employees = Employee.joins(:user).order('users.last_name ASC').all
    else
      @employees = Employee.joins(:user).order('users.last_name DESC').all
    end
  end

  def by_dependency
    @way = params[:order_name]
    if @way.blank? || @way == "DEFAULT"
      @employees = Employee.joins(:dependency, :user).order("dependencies.name_dependency")
    elsif @way == "ASC"
      @employees = Employee.joins(:user).order('users.last_name ASC').all
    else
      @employees = Employee.joins(:user).order('users.last_name DESC').all
    end

  end

  def by_eps
    @way = params[:order_name]
    if @way.blank? || @way == "DEFAULT"
      @employees = Employee.joins(:held_position, :eps_entity).order('held_positions.name_position ASC', 'eps_entities.name_eps ASC')
    elsif @way == "ASC"
      @employees = Employee.joins(:user).order('users.last_name ASC').all
    else
      @employees = Employee.joins(:user).order('users.last_name DESC').all
    end
  end

  def by_pension
    @way = params[:order_name]
    if @way.blank? || @way == "DEFAULT"
      @employees = Employee.joins(:held_position, :afp_entity).order('held_positions.name_position ASC', 'afp_entities.afp_name ASC')
    elsif @way == "ASC"
      @employees = Employee.joins(:user).order('users.last_name ASC').all
    else
      @employees = Employee.joins(:user).order('users.last_name DESC').all
    end
  end

  def graphics
  end

  def by_held_position
    @way = params[:order_name]
    if @way.blank? || @way == "DEFAULT"
      @employees =Employee.includes(:held_position).order("held_positions.name_position")
    elsif @way == "ASC"
      @employees = Employee.joins(:user).order('users.last_name ASC').all
    else
      @employees = Employee.joins(:user).order('users.last_name DESC').all
    end
  end

  # GET /employees/1 or /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees or /employees.json
  def create
    @employee = Employee.new(employee_params)
    @employee.user_id = current_user.id
    @employee.dependency_id = @employee.held_position.dependency_id
    respond_to do |format|
      if @employee.save
        current_user.update(employee_id: @employee.id)
        format.html { redirect_to @employee, notice: "Employee was successfully created." }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1 or /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: "Employee was successfully updated." }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1 or /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: "Employee was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def employee_params
      params.require(:employee).permit(:full_name, :join_date, :payroll_id, :novelty_id, :user_id, :salary, :eps_id ,:held_position_id, :afp_entity_id)
    end
end
