class CoachesController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]

  def show
    @coach = Coach.find(params[:id])
  end

  def new
    @coach = Coach.new
  end

  def create
    @coach = Coach.new(coach_params)
    if @coach.save
      redirect_to people_path, notice: t("coach_created")
    else
      render :new
    end
  end

  def edit
    @coach = Coach.find(params[:id])
  end

  def update
    @coach = Coach.find(params[:id])
    if coach.update(coach_params)
      redirect_to people_path, notice: t("coach_updated")
    else
      render :edit
    end
  end

  def destroy
    @coach = Coach.find(params[:id])
    @coach.destroy!
    redirect_to people_path, notice: t("coach_destroyed")
  end

  private

  def coach_params
    params.require(:coach).permit(:first_name, :last_name, :function, :contact, :photo_url, :about)
  end
end
