class SponsorsController < ApplicationController
  before_filter :login_required
  protect_from_forgery :except => :sort

  def index
    @sponsors ||= Sponsors.all
    @sponsor = Sponsor.new
  end

  def edit
    @sponsor = Sponsor.find(params[:id])
  end

  def create
    @sponsor = Sponsor.new(params[:sponsor])
    if @sponsor.save
      redirect_to sponsors_path, :notice => 'Sponsor was successfully created.'
    else
      render :index
    end
  end

  def update
    @sponsor = Sponsor.find(params[:id])
    if @sponsor.update_attributes(params[:sponsor])
      redirect_to sponsors_path, :notice => 'Sponsor was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @sponsor = Sponsor.find(params[:id])
    @sponsor.destroy
    redirect_to sponsors_path
  end

  def sort
    params[:sponsor].each_with_index do |id, index|
      Sponsor.update_all(['position=?', index+1], ['id=?', id])
    end
    render :nothing => true
  end
end
