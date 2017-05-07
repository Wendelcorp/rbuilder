class EducationsController < ApplicationController

  def index
  end

  def show
    @education = Education.find(params[:id])
  end

  def new
  end

  def create
    @education = Education.new(education_params)
    @education.save

    redirect_to @education
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def education_params
    params.require(:education).permit(:program, :institution, :startdate, :enddate)
  end

end
