class AssignmentsController < ApplicationController
  before_action :set_person, only: [:new, :create]

  def new
    @assignment = Assignment.new
  end

  def create
    @assignment = Assignment.new(assignment_params)
    @assignment.person_id = @person.id
      if @assignment.save
       redirect_to person_assignments_path(@person)
      else
       render :new
      end
  end

   private
   def assignment_params
     params.require(:assignment).permit(:role)
   end

   def set_person
     @person = Person.find(params[:person_id])
   end

end
