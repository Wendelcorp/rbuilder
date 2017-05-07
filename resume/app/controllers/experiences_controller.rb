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
    @experience = Experience.find(params[:id])
  end

  def update
    @experience = Experience.find(params[:id])
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
