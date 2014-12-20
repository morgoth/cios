class SessionsController < ApplicationController
  before_filter :authenticate_user!, only: :destroy

  def new
    @session = ActiveModel::Session.new
  end

  def create
    @session = ActiveModel::Session.new(session_params)
    if @session.valid?
      session[:user_id] = @session.user_id
      redirect_to root_path, notice: "You have been successfully logged in."
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "You have been successfully logged out."
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
