class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def new
    @profile = current_user.profiles.build
  end

  def create
    @profile = current_user.profiles.build(profile_params)
    @profile.save

    redirect_to @profile
  end

  def edit
    @profile = current_user.profiles.find(params[:id])
  end

  def update
    @profile = current_user.profiles.find(params[:id])
    if @profile.update(params[:profile].permit(:firstname, :lastname, :role, :phonenumber, :email, :linkedin, :website))
      redirect_to @profile
    else
      render 'edit'
    end
  end

  def destroy
  end

  private

  def profile_params
    params.require(:profile).permit(:firstname, :lastname, :role, :phonenumber, :email, :linkedin, :website)
  end

end
