class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :user_type ]


  def home
  end

  def profile
    @user = current_user
  end

  def success
  end

  def user_type
  end

  def match_me
    user = current_user
    redirect_to success_url(matching: true)
    user.matchMe if user.valid?
  end

end
