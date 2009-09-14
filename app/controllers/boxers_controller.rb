class BoxersController < ApplicationController
  before_filter :login_required, :except => [:index, :show]

  def index
    @boxers = Boxer.all
  end

  def new
    @boxer = Boxer.new
  end

  def edit
    @boxer = Boxer.find(params[:id])
  end

  def create
    @boxer = Boxer.new(params[:boxer])
    if @boxer.save
      flash[:notice] = t("boxer_created")
      redirect_to boxers_path
    else
      render :new
    end
  end

  def update
    @boxer = Boxer.find(params[:id])
    if @boxer.update_attributes(params[:boxer])
      flash[:notice] = t("boxer_updated")
      redirect_to boxers_path
    else
      render :edit
    end
  end

  def show
    @boxer = Boxer.find(params[:id])
  end

  def destroy
    @boxer = Boxer.find(params[:id])
    @boxer.destroy
    flash[:notice] = t("boxer_destroyed")
    redirect_to boxers_path
  end
end
