class User < ActiveRecord::Base
  has_many :upload_videos, dependent: :destroy, class_name: Video

  # has_many :collections, dependent: :destroy
  # has_many :videos, through: :collections
end

