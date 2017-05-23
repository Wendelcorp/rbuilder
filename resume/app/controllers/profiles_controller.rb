class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @profile = current_user.profiles
    # unless session[:user_id] == @profile.user_id
    #   flash[:notice] = "Oops! That's someone elses page."
    #   redirect_to editor_show_path(session[:user_id])
    #   return
    # end
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
      if @profile.update_attributes(params[:profile].permit(:firstname, :lastname, :role, :phonenumber, :email, :linkedin, :website, :bio))
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
    params.require(:profile).permit(:firstname, :lastname, :role, :phonenumber, :email, :linkedin, :website, :bio)
  end

end
