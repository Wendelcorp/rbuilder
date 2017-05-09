class EditorController < ApplicationController
  before_action :authenticate_user!

  def show
    @profile = current_user.profiles
    @education = current_user.educations
    @experience = current_user.experiences
    @skill = current_user.skills

  end
end
