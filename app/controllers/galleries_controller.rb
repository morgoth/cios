class GalleriesController < ApplicationController

  def albums
      @albums=Picasa.albums 'cios.gilowice'
  end

  def photos
      @album=Picasa.photos('cios.gilowice', params[:id])
  end

end
