class BoxersController < ApplicationController
  respond_to :html
  before_filter :authenticate_user!, :except => [:index, :show]

  def index
    respond_with @boxers = Boxer.all
  end

  def show
    respond_with @boxer = Boxer.find(params[:id])
  end

  def new
    respond_with @boxer = Boxer.new
  end

  def create
    @boxer = Boxer.new(params[:boxer])
    flash[:notice] = t("boxer_created") if @boxer.save
    respond_with @boxer, :location => people_path
  end

  def edit
    respond_with @boxer = Boxer.find(params[:id])
  end

  def update
    @boxer = Boxer.find(params[:id])
    flash[:notice] = t("boxer_updated") if @boxer.update_attributes(params[:boxer])
    respond_with @boxer
  end

  def destroy
    @boxer = Boxer.find(params[:id])
    flash[:notice] = t("boxer_destroyed") if @boxer.destroy
    respond_with @boxer, :location => people_path
  end
end
