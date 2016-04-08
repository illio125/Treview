class HomeController < ApplicationController
  layout 'cover'

  def index
    @travels = Travel.select(:id, :name)
  end
end
