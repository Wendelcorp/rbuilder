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

    respond_to do |format|
      if @experience.update_attributes(params[:experience].permit(:role, :company, :description, :startdate, :enddate))
        format.html { redirect_to(@experience, :notice => 'Updated :)') }
        format.json { respond_with_bip(@experience) }
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@experience) }
      end
    end
  end

  def destroy
  end

  private

  def experience_params
    params.require(:experience).permit(:role, :company, :description, :startdate, :enddate)
  end


end
