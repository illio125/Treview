class VideosController < ApplicationController
  def index
    # render text: params
    @videos = Video.all
  end

  def show
    @video = Video.find params[:id].split("_").first
  end
end
