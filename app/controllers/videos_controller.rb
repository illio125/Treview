class VideosController < ApplicationController
  def index
    # render text: params
    # @videos = Video.all

    subject = params[:for].gsub(/-/, " ")
    @travel = Travel.find_by(name: subject )
    if @travel
      @videos = @travel.videos
    else
      @videos = Video.none
    end
  end

  def show
    @video = Video.find params[:id].split("_").first
  end
end
