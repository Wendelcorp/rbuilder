class SkillsController < ApplicationController

  def index
  end

  def show
    @skill = Skill.find(params[:id])
  end

  def new
  end

  def create
    @skill = Skill.new(skill_params)
    @skill.save

    redirect_to @skill
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def skill_params
    params.require(:skill).permit(:name)
  end

end
