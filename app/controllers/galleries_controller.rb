class GalleriesController < ApplicationController
  def index
    @albums = picasa.album.list
  end

  def show
    @album = picasa.album.show(params[:id])
  rescue Picasa::NotFoundError
    raise ActionController::RoutingError.new("Not Found")
  end

  private

  def picasa
    @picasa ||= Picasa::Client.new(user_id: "cios.gilowice")
  end
end
