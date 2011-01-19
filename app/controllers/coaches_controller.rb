class CoachesController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]

  def new
    @coach = Coach.new
  end

  def edit
    @coach = Coach.find(params[:id])
  end

  def create
    @coach = Coach.new(params[:coach])
    if @coach.save
      redirect_to people_path, :notice => t("coach_created")
    else
      render :new
    end
  end

  def update
    @coach = Coach.find(params[:id])
    if @coach.update_attributes(params[:coach])
      redirect_to people_path, :notice => t("coach_updated")
    else
      render :edit
    end
  end

  def show
    @coach = Coach.find(params[:id])
  end

  def destroy
    @coach = Coach.find(params[:id])
    @coach.destroy
    redirect_to people_path, :notice => t("coach_destroyed")
  end
end
