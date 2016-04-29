require 'google/api_client'
require 'json'

class Video < ActiveRecord::Base
  belongs_to :uploader, foreign_key: :user_id, class_name: User
  belongs_to :travel

  def self.create_from_youtube(vid)
    video = self.find_by(vid: vid)
    return video if video.present?

    result = self.fetch_from_youtube(vid)

    if result['items'].empty? #or result['items'][0]['contentDetails']['licensedContent'] == false
      return false
    else
      # puts "***#{result['items'][0]['contentDetails']['licensedContent']} and #{result['items'][0]['status']['embeddable']}"

      title = result["items"][0]["snippet"]["title"]
      media_url = "http://www.youtube.com/embed/#{vid}?rel=0&controls=1&disablekb=1&fs=0"
      thumbnails = result["items"][0]["snippet"]["thumbnails"]
      thumbnail  = thumbnails["high"] || thumbnails["standard"] || thumbnails["medium"] || thumbnails["default"]
      cover_url  = thumbnail['url']
      dur = /^*(\d+)M(\d+)S/.match(result["items"][0]["contentDetails"]["duration"])
      if dur == nil
        duration = 100
      else
        dur = dur.captures.map(&:to_i).reverse
        duration = dur[0] + dur[1] * 60
      end

      video = Video.new(vid: vid, title: title, media_url: media_url, cover_url: cover_url, duration: duration)
      video.save
      video
    end
  end

  def self.fetch_from_youtube(vid)
    client = Google::APIClient.new(application_name: 'vertatube', application_version: '0.1' )
    youtube = client.discovered_api('youtube', 'v3')
    client.authorization = nil
    result = client.execute(key:  Figaro.env.youtube_key, api_method: youtube.videos.list, parameters: {id: vid, part: 'snippet, contentDetails, status'})
    result = JSON.parse(result.data.to_json)
  end

  def id_with_title
    # "#{id}-#{video.vid}"
    # "#{id}-#{title}".gsub(/[ \-()\[\].\/']/,"_").squeeze("_").downcase()
    "#{id}-#{title}".gsub(/[ \-()\[\].\/'&]/,"_").squeeze("_").downcase()
  end

  def self.sample_video(vid, subject, user)
    video = Video.create_from_youtube(vid)
    if video
      video.travel = Travel.parse_subject(subject)
      video.uploader = user if user.present?
      video.save
      puts "#{vid} was created"
    else
      puts "#{vid} was rejected"
    end
  end
end
