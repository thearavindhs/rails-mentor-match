class UserMailer < ApplicationMailer
  default from: 'from@example.com'

  def matching_email
    @user = params[:user]
    @url = "www.google.com"
    mail(to: @user.email, subject: "You've been matched!")
  end
end
