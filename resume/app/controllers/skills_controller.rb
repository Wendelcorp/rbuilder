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
    if @skill.update(params[:skill].permit(:name))
      redirect_to @skill
    else
      render 'edit'
    end
  end

  def destroy
  end

  private

  def skill_params
    params.require(:skill).permit(:name)
  end

end
