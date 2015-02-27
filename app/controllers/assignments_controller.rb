class AssignmentsController < ApplicationController
  before_action :set_person, only: [:new, :create, :destroy]

  def new
    @assignment = Assignment.new
  end

  def create
    @assignment = Assignment.new(assignment_params)
    @location = Location.find(params[:location_id])
    @assignment.person_id = @person.id
    @assignment.location_id = @location.id
      if @assignment.save
       redirect_to person_path(@person)
      else
       render :new
      end
  end

  def destroy
    # @assignment = Assignment.find(params[:id])
    @assignment.person_id = params[:person_id]
    @assignment.location_id = params[:location_id]
    @assignment.destroy
     redirect_to person_path(@person), notice: 'Task was successfully destroyed.'
  end

   private
   def assignment_params
     params.require(:assignment).permit(:role)
   end

   def set_person
     @person = Person.find(params[:person_id])
   end

end
