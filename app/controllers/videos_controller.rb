class VideosController < ApplicationController
  def index
    subject = params[:for].gsub(/-/, " ")
    @travels = Travel.search(subject)
    @videos = Video.where(travel_id: @travels.map(&:id))
  end

  def show
    @video = Video.find params[:id].split("_").first
  end
end
