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

    respond_to do |format|
      if @profile.update_attributes(params[:profile].permit(:firstname, :lastname, :role, :phonenumber, :email, :linkedin, :website))
        format.html { redirect_to(@profile, :notice => 'Updated :)') }
        format.json { respond_with_bip(@profile) }
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@profile) }
      end
    end
  end

  def destroy
  end

  private

  def profile_params
    params.require(:profile).permit(:firstname, :lastname, :role, :phonenumber, :email, :linkedin, :website)
  end

end
