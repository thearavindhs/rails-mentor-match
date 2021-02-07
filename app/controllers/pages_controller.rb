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

end
