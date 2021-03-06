class UserMailer < ApplicationMailer
  default from: 'mentor.match.pro@gmail.com'

  def matching_email
    @user = params[:user]
    @url = "https://match-my-mentor.herokuapp.com"
    mail(to: @user.email, subject: "You've been matched")
  end

  def welcome_email
    @user = params[:user]
    @url = "https://match-my-mentor.herokuapp.com"
    mail(to: @user.email, subject: "Welcome to Mentor Match")
  end
end
