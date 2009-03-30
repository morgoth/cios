class SponsorsController < ApplicationController
	before_filter :login_required
  def new
    @sponsor = Sponsor.new

    respond_to do |format|
      format.html
      format.xml  { render :xml => @sponsor }
    end
  end

  def edit
    @sponsor = Sponsor.find(params[:id])
  end

  def create
    @sponsor = Sponsor.new(params[:sponsor])

    respond_to do |format|
      if @sponsor.save
        flash[:notice] = 'Sponsor was successfully created.'
        format.html { redirect_to(posts_path) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @sponsor = Sponsor.find(params[:id])

    respond_to do |format|
      if @sponsor.update_attributes(params[:sponsor])
        flash[:notice] = 'Sponsor was successfully updated.'
        format.html { redirect_to(posts_path) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @sponsor = Sponsor.find(params[:id])
    @sponsor.destroy

    respond_to do |format|
      format.html { redirect_to(posts_url) }
    end
  end
end
