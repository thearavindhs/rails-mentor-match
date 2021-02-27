  class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :user_type ]

  def home
  end

  def tips
  end

  def complete_profile
    @user = current_user
    @countries = ["USA", "Canada", "Mexico"]
    @genders = ["Male", "Female", "Non Binary"]
    @languages = ["English", "Spanish", "French"]
    @experiences = ["0-2", "3-5", "6-8", "9-11", "12-15", "16-18", "18-21"]
    @industries = ["Information Technology and Services", "Hospital & Health Care", "Construction", "Education Management", "Retail", "Financial Services", "Accounting", "Computer Software", "Automotive", "Higher Education"]
  end

  def roles
    @user = current_user
  end

  def confirmation
  end

  def profile
    @user = current_user
    if @user.first_name.nil?
      redirect_to complete_profile_url(user_type: @user.user_type)
    elsif @user.role.nil?
      redirect_to roles_url(user_type: @user_type)
    end
    # UserMailer.with(user: @user).matching_email.deliver_now
  end

  def success
    if !params[:match].nil?
     @matched =  params[:match]
    end
  end

  def user_type
  end

  def match_me

    user = current_user

    if user.valid? && user.user_type == "mentee" && (user.mentor.nil? || user.mentor.count.zero?)
      user.matchMe
      redirect_to success_url(match: true)
      # redirect_to success_url(matching: true)
    end
  end

  def update_roles
    @user = current_user
    @user.attributes = user_params
    if @user.save
      redirect_to preferences_url
    else
      redirect_to roles(user_type: @user.user_type)
    end
  end

  def preferences
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :language, :country,
                                 :city, :gender, :role, :industry, :experience,
                                 :maximum_mentee, :email, :password, :password_confirmation,
                                 :city_preference, :country_preference, :gender_preference,
                                 :language_preference, :role_preference, :experience_preference,
                                 :industry_preference, :company, :linkedin_url, :university, :photo, :title)
  end



end




