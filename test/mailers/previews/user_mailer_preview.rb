# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def new_matching_email
    # Set up a temporary order for the preview
    user = User.new(email: "myTest@gmail.com", password: "password", first_name: "Alberto")
    UserMailer.with(user: user).matching_email
  end
  def new_welcome_email
    user = User.new(email: "myTest@gmail.com", password: "password", first_name: "Alberto")
    UserMailer.with(user: user).welcome_email
  end
end
