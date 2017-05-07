class EditorController < ApplicationController
  def index
    @profile = Profile.all
    @education = Education.all
    @experience = Experience.all
    @skill = Skill.all
  end
end
