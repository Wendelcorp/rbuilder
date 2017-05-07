class ExperiencesController < ApplicationController

  def index
  end

  def show
    @experience = Experience.find(params[:id])
  end

  def new
  end

  def create
    @experience = Experience.new(experience_params)
    @experience.save

    redirect_to @experience
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def experience_params
    params.require(:experience).permit(:role, :company, :description, :startdate, :enddate)
  end


end
