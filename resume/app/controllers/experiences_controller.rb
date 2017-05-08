class ExperiencesController < ApplicationController

  def index
    @experiences = current_user.experiences
  end

  def show
    @experience = current_user.experience.find(params[:id])
  end

  def new
    @experience = current_user.experience.build
  end

  def create
    @experience = current_user.experience.build(experience_params)
    @experience.save

    redirect_to @experience
  end

  def edit
    @experience = current_user.experience.find(params[:id])
  end

  def update
    @experience = current_user.experience.find(params[:id])
    if @experience.update(params[:experience].permit(:role, :company, :description, :startdate, :enddate))
      redirect_to @experience
    else
      render 'edit'
    end
  end

  def destroy
  end

  private

  def experience_params
    params.require(:experience).permit(:role, :company, :description, :startdate, :enddate)
  end


end
