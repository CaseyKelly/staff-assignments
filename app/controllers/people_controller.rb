class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  def index
    @people = Person.all
  end

  def new
    @person = Person.new
  end

  def show
    @assignments = @person.assignments
  end

  def edit
  end

  def create
    @person = Person.new(params.require(:person).permit(:first_name, :last_name, :title))
    if @person.save
      redirect_to root_path, notice: "Person was created!"
    else
      flash.now[:alert] = "Last name and Title or First Name must be present"
      render :new
    end
  end

  def update
    if @person.update(person_params)
      redirect_to people_path, notice: 'Person was updated.'
    else
      flash.now[:alert] = "Last name and Title or First Name must be present"
      render :edit
    end
  end

  private

    def set_person
      @person = Person.find(params[:id])
    end

    def person_params
      params.require(:person).permit(:title, :first_name, :last_name)
    end

end
