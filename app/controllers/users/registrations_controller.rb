# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @user_type = params[:user_type]
    @countries = ["Canada", "United States", "Mexico"]
    @cities = ["City 1", "City 2", "City 3", "City 4", "City 5"]
    @genders = ["Male", "Female", "Non Binary"]
    @languages = ["English", "Spanish", "French"]
    super
  end
  # POST /resource

  def create
    @user = User.new(user_params)
    if !@user.industry.empty? && !@user.experience.zero?
      @user.user_type = "mentor"
    else
      @user.user_type = "mentee"
    end

    if @user.save
      redirect_to success_url
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :language, :country,
                                 :city, :gender, :role, :industry, :experience,
                                 :maximum_mentee, :email, :password, :password_confirmation,
                                 :city_preference, :country_preference, :gender_preference,
                                 :language_preference, :role_preference, :experience_preference,
                                 :industry_preference)
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
