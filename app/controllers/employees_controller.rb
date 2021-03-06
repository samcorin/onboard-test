class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:edit, :update, :new, :create, :index]

  # GET /employees
  # GET /employees.json
  def index
    # @employees = Employee.all
    @employees = @user.employees

  end

  # GET /employees/1
  # GET /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
    # @user = current_user
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)
    @employee.user = @user

    if @employee.save
      # Tell the UserMailer to send a welcome email after save
      EmployeeMailer.welcome_email(@employee).deliver_now
      redirect_to user_employees_path
    else
      render :new
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    # @user = User.find(params[:user_id])
    # @employee = User.find(params[:id])
    @user = @employee.user

    @employee.destroy
    redirect_to user_employees_path(@user)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :email, :user)
    end
end
