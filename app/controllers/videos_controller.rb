class VideosController < ApplicationController
  def index
    # puts "***#{params[:for]}"
    subject = params[:for].gsub(/-/, " ")
    @travels = Travel.search(subject)
    @videos = Video.where(travel_id: @travels.map(&:id))
  end

  def show
    @video = Video.find params[:id].split("_").first
  end

  def create
    if params[:video][:youtube_url]
      vid = Video.vid_from_youtube_url(params[:video][:youtube_url])
      video = Video.create_from_youtube(vid)
      if video
        video.update(uploader: current_user, travel_id: params[:video][:travel_id] )
        redirect_to videos_path(for: video.travel.subject.gsub(/ /, "-")), notice: 'New video was successfully added'
        # redirect_to :back, notice: 'New video was successfully added'
      else
        redirect_to :back, flash: { warning: 'Oops, Something wrong!' }
      end
    else
      render text: 'No Youtube URL'
    end

  end

  def destroy
    @video = Video.find(params[:id])
    @video.destroy

    redirect_to :back
  end
end