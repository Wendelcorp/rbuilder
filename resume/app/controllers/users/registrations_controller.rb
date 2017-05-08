class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    super
    if resource.save
      @profile = current_user.profiles.build(:firstname => 'Bryce', :lastname => 'Wendelaar', :role => 'Developer & Designer', :phonenumber => '19059664760', :email => 'bryce@brycewendelaar.com', :linkedin => 'www.linkedin.com/brycewendelaar', :website => 'www.brycewendelaar.com')
      @education1 = current_user.educations.build(:program => 'Web Development', :institution => 'Bitmaker', :startdate => '2007-07-01', :enddate => '2010-04-01')
      @education2 = current_user.educations.build(:program => 'Creative Advertising', :institution => 'Mohawk College', :startdate => '2007-07-01', :enddate => '2010-04-01')
      @experience1 = current_user.experiences.build(:role => 'UX Designer', :company => 'Google', :description => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean ultrices sapien elit, non convallis neque interdum id. Ut vulputate pulvinar velit, at euismod leo feugiat nec. Proin id egestas dui. Donec in mi dui.', :startdate => '2007-07-01', :enddate => '2010-04-01')
      @experience2 = current_user.experiences.build(:role => 'UX Designer', :company => 'Google', :description => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean ultrices sapien elit, non convallis neque interdum id. Ut vulputate pulvinar velit, at euismod leo feugiat nec. Proin id egestas dui. Donec in mi dui.', :startdate => '2007-07-01', :enddate => '2010-04-01')
      @experience3 = current_user.experiences.build(:role => 'UX Designer', :company => 'Google', :description => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean ultrices sapien elit, non convallis neque interdum id. Ut vulputate pulvinar velit, at euismod leo feugiat nec. Proin id egestas dui. Donec in mi dui.', :startdate => '2007-07-01', :enddate => '2010-04-01')
      @skill1 = current_user.skills.build(:name => 'Photoshop')
      @skill2 = current_user.skills.build(:name => 'Ruby On Rails')
      @skill3 = current_user.skills.build(:name => 'Front End Development')

      @profile.save
      @education1.save
      @education2.save
      @experience1.save
      @experience2.save
      @experience3.save
      @skill1.save
      @skill2.save
      @skill3.save

    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
