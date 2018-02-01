# Preview all emails at http://localhost:3000/rails/mailers/user
class UserPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user/welcome
  def welcome
    user = User.new(email: "test@example.com", password: "password")
    UserMailer.welcome(user, "foobar-token")
  end

end
