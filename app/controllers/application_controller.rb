class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  protected

  def user_is_admin?
    current_user.try(:admin?)
  end

  helper_method :user_is_admin?

  def require_admin
    head :forbidden unless user_is_admin?
  end
end
