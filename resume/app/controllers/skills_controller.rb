class SkillsController < ApplicationController

  def index
    @skills = current_user.skills
  end

  def show
    @skill = current_user.skills.find(params[:id])
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
