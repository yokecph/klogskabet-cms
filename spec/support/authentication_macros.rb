module AuthenticationMacros
  def sign_in_as_user(attributes = {})
    @request.env["devise.mapping"] = :user
    model = FactoryBot.create(:user, attributes)
    sign_in model
    model
  end
end
