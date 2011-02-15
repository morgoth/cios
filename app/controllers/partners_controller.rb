class PartnersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @partners = Partner.ordered
  end

  def new
    @partner = Partner.new
  end

  def edit
    @partner = Partner.find(params[:id])
  end

  def create
    @partner = Partner.new(params[:partner])
    if @partner.save
      redirect_to partners_path, :notice => 'Partner was successfully created.'
    else
      render :new
    end
  end

  def update
    @partner = Partner.find(params[:id])
    if @partner.update_attributes(params[:partner])
      redirect_to partners_path, :notice => 'Partner was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @partner = Partner.find(params[:id])
    @partner.destroy
    redirect_to partners_path
  end

  def up
    @partner = Partner.find(params[:id])
    @partner.move_higher
    redirect_to partners_path, :notice => "#{@partner.name} moved up"
  end

  def down
    @partner = Partner.find(params[:id])
    @partner.move_lower
    redirect_to partners_path, :notice => "#{@partner.name} moved down"
  end
end
