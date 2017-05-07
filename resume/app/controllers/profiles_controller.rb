class ProfilesController < ApplicationController

  def index
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.save

    redirect_to @profile
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
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
