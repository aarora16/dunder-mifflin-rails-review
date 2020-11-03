class DogsController < ApplicationController
  def show
    @dog = Dog.find(params[:id])
    @employees = Employee.select {|employee| employee.dog_id == @dog.id}
  end

  def index
    @dogs = Dog.all
  end

end
