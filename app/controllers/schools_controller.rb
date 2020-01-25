class SchoolsController < ApplicationController
  # TODO: add this back in later when things are working again
  #before_action :load_school, only: %i(show edit update destroy)

  def index
    @schools = School.all
  end

  def show
  end

  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)
    if @school.save
      redirect_to(schools_path, notice: "School added")
    else
      flash[:alert] = "Error saving school"
      render(:new)
    end
  end

  def edit
    @school = School.find(params[:id])
  end

  def update
    @school = School.find(params[:id])
    if @school.update(school_params)
    redirect_to(school_path, notice: "School updated")
    else
      flash[:alert] = "Error saving school"
      render(:edit)
    end
  end

  def destroy
    @school = School.find(params[params:id])
    @school.destroy
    redirect_to(schools_path, notice: "School deleted")
  end

  private

  def load_school
    @school = School.find(params[:id])
  end

  def school_params
    params.require(:school).permit(:name, :address, :principal, :capacity, :private_school)
  end
end
