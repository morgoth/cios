class UsersController < ApplicationController
	before_filter :login_required
	before_filter :account_owner, :only => [:edit, :update]
	
	def index
		@users=User.all( :order => "login")
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
      render :action => :new
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
      flash[:notice] = "Account updated!"
      redirect_to account_url
    else
      render :action => :edit
    end
  end
  
	def destroy
    id = params[:id]
    if id && user = User.find(id)
      begin
        user.safe_delete
        flash[:notice] = "User #{user.login} usunięty"
      rescue Exception => e
        flash[:notice] = e.message
      end
    end 
    respond_to do |format|
      format.html { redirect_to(users_path) }
    end
  end 

	private
	def account_owner
    unless @current_user==User.find(params[:id])
      redirect_to users_path
      flash[:notice] = "You can't edit others profile"
    end
  end

end
