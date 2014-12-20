class PasswordResetsController < ApplicationController
  def new
    @password_reset = ActiveModel::PasswordReset.new
  end

  def create
    @password_reset = ActiveModel::PasswordReset.new(password_reset_params)
    if @password_reset.valid?
      UserMailer.reset_password(@password_reset.email, @password_reset.token).deliver
      redirect_to root_url, notice: "You will receive an email with instructions."
    else
      render :new
    end
  end

  def edit
    # find raises TokenInvalid, TokenExpired, EmailInvalid, PasswordChanged exceptions
    @password_reset = ActiveModel::PasswordReset.find(params[:id])
    @user = @password_reset.user
  rescue ActiveModel::PasswordReset::Error
    raise ActiveRecord::RecordNotFound # display 404
  end

  def update
    @password_reset = ActiveModel::PasswordReset.find(params[:id])
    @user = @password_reset.user
    if @user.update(user_params)
      redirect_to root_path, notice: "Password changed successfully, you can now log in."
    else
      render :edit
    end
  rescue ActiveModel::PasswordReset::Error
    raise ActiveRecord::RecordNotFound # display 404
  end

  private

  def password_reset_params
    params.require(:password_reset).permit(:email)
  end

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
