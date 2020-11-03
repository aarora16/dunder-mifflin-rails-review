class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new
    @employee = Employee.new
    @dogs = Dog.all
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      flash[:notice] = "Employee Created!"
      redirect_to employee_path(@employee)
    else
      render "new"
    end
  end

  def update
    @employee = Employee.find(params[:id])
    @employee.update(employee_params)
    redirect_to employee_path(@employee)
  end

  private
    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :alias, :title, :dog_id, :office, :img_url)
    end
end
