  class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :user_type ]

  def home
  end

  def tips
  end

  def profile
    @user = current_user
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
end
