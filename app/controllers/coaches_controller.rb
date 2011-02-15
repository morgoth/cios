class CoachesController < ApplicationController
  respond_to :html
  before_filter :authenticate_user!, :except => [:show]

  def show
    respond_with @coach = Coach.find(params[:id])
  end

  def new
    respond_with @coach = Coach.new
  end

  def create
    @coach = Coach.new(params[:coach])
    flash[:notice] = t("coach_created") if @coach.save
    respond_with @coach, :location => people_path
  end

  def edit
    respond_with @coach = Coach.find(params[:id])
  end

  def update
    @coach = Coach.find(params[:id])
    flash[:notice] = t("coach_updated") if @coach.update_attributes(params[:coach])
    respond_with @coach, :location => people_path
  end

  def destroy
    @coach = Coach.find(params[:id])
    flash[:notice] = t("coach_destroyed") if @coach.destroy
    respond_with @coach, :location => people_path
  end
end
