class EducationsController < ApplicationController
    before_action :authenticate_user!

  def show
    @education = current_user.educations.find(params[:id])
    unless session[:user_id] == @education.user_id
      flash[:notice] = "Oops! That's someone elses page."
      redirect_to editor_index_path(session[:user_id])
      return
    end
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

    respond_to do |format|
      if @education.update_attributes(params[:education].permit(:program, :institution, :startdate, :enddate))
        format.html { redirect_to(@education, :notice => 'Updated :)') }
        format.json { respond_with_bip(@education) }
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@education) }
      end
    end
  end

  def destroy
  end

  private

  def education_params
    params.require(:education).permit(:program, :institution, :startdate, :enddate)
  end

end
