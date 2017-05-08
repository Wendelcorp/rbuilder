class EducationsController < ApplicationController

  def index
    @educations = current_user.educations
  end

  def show
    @education = current_user.educations.find(params[:id])
  end

  def new
    @education = current_user.educations.build
  end

  def create
    @education = current_user.educations.build(education_params)
    @education.save
    redirect_to education_path
  end

  def edit
    @education = current_user.educations.find(params[:id])
  end

  def update
    @education = current_user.educations.find(params[:id])
    if @education.update(params[:education].permit(:program, :institution, :startdate, :enddate))
      redirect_to education_url(@education.user_id)
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
