class GalleriesController < ApplicationController

  def index
    @albums = Picasa.albums( :google_user => "cios.gilowice" )
  end

  def show
    @album = Picasa.photos( :google_user => 'cios.gilowice', :album_id => params[:id])
  end
end
