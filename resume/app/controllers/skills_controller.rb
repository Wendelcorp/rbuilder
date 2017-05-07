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
    @skill = Skill.find(params[:id])
  end

  def update
    @skill = Skill.find(params[:id])
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
