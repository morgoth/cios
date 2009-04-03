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

    respond_to do |format|
      if @sponsor.save
        flash[:notice] = 'Sponsor was successfully created.'
        format.html { redirect_to(sponsors_path) }
      else
        format.html { render :action => "index" }
      end
    end
  end

  def update
    @sponsor = Sponsor.find(params[:id])

    respond_to do |format|
      if @sponsor.update_attributes(params[:sponsor])
        flash[:notice] = 'Sponsor was successfully updated.'
        format.html { redirect_to(sponsors_path) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @sponsor = Sponsor.find(params[:id])
    @sponsor.destroy

    respond_to do |format|
      format.html { redirect_to(sponsors_url) }
    end
  end
	
	def sort
	  params[:sponsor].each_with_index do |id, index|
			Sponsor.update_all(['position=?', index+1], ['id=?', id])
		end
		render :nothing => true
	end
end
