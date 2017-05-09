class EditorController < ApplicationController
  before_action :authenticate_user!

  def show
    @profile = current_user.profiles
    @education = current_user.educations
    @experience = current_user.experiences
    @skill = current_user.skills

    respond_to do |format|
      format.html
      format.pdf do
        render pdf:"Resume",
        template: "editor/resume.pdf.erb",
        locals: {
          @profile => current_user.profiles,
          @education => current_user.educations,
          @experience => current_user.experiences,
          @skill => current_user.skills
        }
      end
    end
  end
end
