class GalleriesController < ApplicationController

  def albums
    @albums = Picasa.albums :google_user => 'cios.gilowice'
  end

  def photos
    @album = Picasa.photos(:google_user => 'cios.gilowice', :album_id => params[:id])
  end

end
