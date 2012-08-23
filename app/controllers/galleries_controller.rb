class GalleriesController < ApplicationController
  respond_to :html

  def index
    respond_with @albums = picasa.album.list
  end

  def show
    respond_with @album = picasa.album.show(params[:id])
  end

  private

  def picasa
    @picasa ||= Picasa::Client.new(user_id: "cios.gilowice")
  end
end
