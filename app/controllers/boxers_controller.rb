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
      redirect_to people_path, :notice => t("boxer_created")
    else
      render :new
    end
  end

  def update
    @boxer = Boxer.find(params[:id])
    if @boxer.update_attributes(params[:boxer])
      redirect_to people_path, :notice => t("boxer_updated")
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
    redirect_to people_path, :notice => t("boxer_destroyed")
  end
end
