class ExperiencesController < ApplicationController
  before_action :authenticate_user!

  def show
    @experience = Experience.find(params[:id])
    unless session[:user_id] == @experience.user_id
      flash[:notice] = "Oops! That's someone elses page."
      redirect_to editor_index_path(session[:user_id])
      return
    end
  end

  def new
    @experience = current_user.experiences.build
  end

  def create
    @experience = current_user.experiences.build(experience_params)
    @experience.save

    redirect_to @experience
  end

  def edit
    @experience = current_user.experiences.find(params[:id])
  end

  def update
    @experience = current_user.experiences.find(params[:id])

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
