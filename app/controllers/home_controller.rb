class HomeController < ApplicationController
  def index
    @travels = Travel.select(:id, :subject)
  end
end
