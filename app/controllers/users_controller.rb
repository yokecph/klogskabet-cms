class UsersController < ApplicationController
  before_action :require_admin
  before_action :load_user, only: :destroy

  def index
    @users = User.where.not(id: current_user.id).order(:email)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_creation_params)
    @user.password = Devise.friendly_token.first(8)

    if @user.save
      token = @user.__send__(:set_reset_password_token)
      UserMailer.welcome(@user, token, params[:message], params[:reply_to] === 1 ? current_user : nil).deliver_later
      redirect_to users_path, notice: "User account created. An email has been sent to #{@user.email}"
    else
      render :new
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: "User acccount for #{@user.email} deleted"
  end

  private

  def load_user
    @user = User.find(params[:id])
  end

  def user_creation_params
    params.require(:user).permit(:email, :admin)
  end
end
