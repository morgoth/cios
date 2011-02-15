class GalleriesController < ApplicationController
  respond_to :html

  def index
    respond_with @albums = Picasa.albums
  end

  def show
    respond_with @album = Picasa.photos(:album_id => params[:id])
  end
end
