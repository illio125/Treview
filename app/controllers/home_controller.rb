class HomeController < ApplicationController
  def index
    @travels = Travel.select(:id, :name)
  end
end
