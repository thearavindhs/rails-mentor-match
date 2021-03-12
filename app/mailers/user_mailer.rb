class UserMailer < ApplicationMailer
  default from: 'mentor.match.pro@gmail.com'

  def matching_email
    @user = params[:user]
    @profile_url = "http://thementormatch.club/profile"
    @url = "http://thementormatch.club/"
    mail(to: @user.email, subject: "You've been matched")
  end

  def welcome_email
    @user = params[:user]
    @url = "http://thementormatch.club/"
    mail(to: @user.email, subject: "Welcome to Mentor Match")
  end
end
