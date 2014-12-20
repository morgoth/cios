class BoxersController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  def index
    @boxers = Boxer.all
  end

  def show
    @boxer = Boxer.find(params[:id])
  end

  def new
    @boxer = Boxer.new
  end

  def create
    @boxer = Boxer.new(boxer_params)
    if @boxer.save
      redirect_to people_path, notice: t("boxer_created")
    else
      render :new
    end
  end

  def edit
    @boxer = Boxer.find(params[:id])
  end

  def update
    @boxer = Boxer.find(params[:id])
    if @boxer.update(boxer_params)
      redirect_to people_path, notice: t("boxer_updated")
    else
      render :edit
    end
  end

  def destroy
    @boxer = Boxer.find(params[:id])
    @boxer.destroy!
    redirect_to people_path, notice: t("boxer_destroyed")
  end

  private

  def boxer_params
    params.require(:boxer).permit(:first_name, :last_name, :birth_date, :weight, :photo_url, :active)
  end
end
