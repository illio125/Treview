class VideosController < ApplicationController
  def index
    # render text: params
    @videos = Video.all #지금은 모든 영상을 가져왔지만원래는 검색 결과를 가져와야 한다


  end

  def show
    @video = Video.find params[:id]
  end
end
