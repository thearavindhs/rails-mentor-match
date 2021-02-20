class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :user_type ]

  def home
  end

  def profile
    @user = current_user
    # UserMailer.with(user: @user).matching_email.deliver_now
  end

  def success
    if params[:matching].nil?
      @matching = false
    else
      @matching = true
      redirect_to profile_url
    end
  end

  def user_type
  end

  def match_me
    user = current_user

    if user.valid? && user.user_type == "mentee" && (user.mentor.nil? || user.mentor.count.zero?)

      user.matchMe
      # redirect_to success_url(matching: true)
      redirect_to profile_url
    else
      redirect_to root_url
    end
  end
end
