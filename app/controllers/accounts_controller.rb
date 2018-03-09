class AccountsController < ApplicationController
  def show
  end

  def edit
  end

  def update
    if current_user.valid_password?(params[:account][:current_password])
      if current_user.update_attributes(account_params)
        bypass_sign_in(current_user)
        redirect_to account_path, notice: true
      else
        current_user.errors[:base] << "Current password incorrect"
        render :edit
      end
    end
  end

  def destroy
    current_user.destroy
    redirect_to root_path
  end

  private

  def account_params
    params.require(:account).permit(:password, :password_confirmation)
  end
end
