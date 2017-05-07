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
    @education = Education.find(params[:id])
  end

  def update
    @education = Education.find(params[:id])
    if @education.update(params[:education].permit(:program, :institution, :startdate, :enddate))
      redirect_to @education
    else
      render 'edit'
    end
  end

  def destroy
  end

  private

  def education_params
    params.require(:education).permit(:program, :institution, :startdate, :enddate)
  end

end
