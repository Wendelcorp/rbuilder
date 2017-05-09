class SkillsController < ApplicationController
  before_action :authenticate_user!

  def show
    @skill = current_user.skills.find(params[:id])
    unless session[:user_id] == @skill.user_id
      flash[:notice] = "Oops! That's someone elses page."
      redirect_to editor_show_path(session[:user_id])
      return
    end
  end

  def new
    @skill = current_user.skills.build
  end

  def create
    @skill = current_user.skills.build(skill_params)
    @skill.save

    redirect_to @skill
  end

  def edit
    @skill = current_user.skills.find(params[:id])
  end

  def update
    @skill = current_user.skills.find(params[:id])

    respond_to do |format|
      if @skill.update_attributes(params[:skill].permit(:name))
        format.html { redirect_to(@skill, :notice => 'Updated :)') }
        format.json { respond_with_bip(@skill) }
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@skill) }
      end
    end
  end

  def destroy
  end

  private

  def skill_params
    params.require(:skill).permit(:name)
  end

end
