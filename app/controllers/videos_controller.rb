class VideosController < ApplicationController
  def index
    puts "***#{params[:for]}"
    subject = params[:for].gsub(/-/, " ")
    @travels = Travel.search(subject)
    @videos = Video.where(travel_id: @travels.map(&:id))
  end

  def show
    @video = Video.find params[:id].split("_").first
  end

  def destroy
    @video = Video.find(params[:id])
    @video.destroy

    redirect_to :back
  end
end
