class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :user_type ]

  def home
  end

  def profile
    @user = current_user
  end

  def success
    if params[:matching].nil?
      @matching = false
    else
      @matching = true
    end
  end

  def user_type
  end

  def match_me
    # user = current_user
    # user.match_me if user.valid?
    # puts "match me now"
    # redirect_to success_url(matching: true)
  end

end
