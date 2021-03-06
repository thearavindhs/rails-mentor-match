class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :user_type ]

  # --------------- Static Pages: ---------------

  def home
  end

  def tips
  end

  def confirmation
    @user = current_user
    if !@user.mentor.nil? || !@user.mentees.empty?
      redirect_to profile_url
    end
  end

  def success
    @user = current_user
    if @user.user_type == "mentee" && @user.mentor.nil?
      if @user.matchMe == 0
        redirect_to profile_url(error: true)
      else
        UserMailer.with(user: @user).matching_email.deliver_now
        UserMailer.with(user: @user.mentor).matching_email.deliver_now
      end

    end
  end

  def user_type
  end

  def profile
    @user = current_user
    if @user.first_name.nil?
      redirect_to complete_profile_url
    end
  end

  # ---------------------------------------------

  # --------------- GET pages ---------------
  def complete_profile
    @user = current_user
    @countries = ["USA", "Canada", "Mexico"]
    @genders = ["Male", "Female", "Non Binary"]
    @languages = ["English", "Spanish", "French"]
    @experience = ["0-5 years", "6-15 years", "16+ years"]
  end

  def roles
    @user = current_user
  end

  def preferences
    @user = current_user
    @countries = ["USA", "Canada", "Mexico"]
    @genders = ["Male", "Female", "Non Binary"]
    @languages = ["English", "Spanish", "French"]
  end

  # ----------------------------------------

  # --------------- UPDATE pages ---------------

  def update_roles
    @user = current_user
    @user.attributes = user_params
    if @user.save
      redirect_to preferences_url
    else
      redirect_to roles_url
    end
  end

  def update_preferences
    @user = current_user
    @user.attributes = user_params
    if @user.save
      # match_me
      redirect_to success_url
    else
      redirect_to preferences_url(error: :true)
    end
  end

  # -------------------- Match Me Page -----------------------
  def match_me
    user = current_user
    if user.valid? && user.user_type == "mentee" && (user.mentor.nil? || user.mentor.count.zero?)
      if user.matchMe == 0
        raise
      else
        redirect_to success_url(match: true)
      end
      # redirect_to success_url(matching: true)
    end
  end
  # ------------------------------------------------------------

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :language, :country,
                                 :city, :gender, :role, :industry, :experience,
                                 :maximum_mentee, :email, :password, :password_confirmation,
                                 :city_preference, :country_preference, :gender_preference,
                                 :language_preference, :role_preference, :experience_preference,
                                 :industry_preference, :company, :linkedin_url, :university, :photo, :title)
  end

  def valid?(user)
    return user.valid? && user.user_type == "mentee" && !user.mentor.nil? && user.mentor.count.zero?
  end

end
