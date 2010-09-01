class UsersController < ApplicationController
  before_filter :login_required
  before_filter :account_owner, :only => [:edit, :update]

  def index
    @users = User.all(:order => "login")
  end
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Account registered!"
      redirect_back_or_default account_url
    else
      render :new
    end
  end

  def show
    @user = @current_user
  end

  def edit
    @user = @current_user
  end

  def update
    @user = @current_user
    if @user.update_attributes(params[:user])
      redirect_to account_url, :notice => "Account updated!"
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "User deleted"
    else
      flash[:alert] = "Last user cannot be deleted"
    end
    redirect_to users_path
  end

  private

  def account_owner
    unless @current_user == User.find(params[:id])
      redirect_to users_path, :notice => "You can't edit others profile"
    end
  end
end
