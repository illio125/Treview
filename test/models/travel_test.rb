require "test_helper"

class TravelTest < ActiveSupport::TestCase
  def travel
    @travel ||= Travel.new
  end

  def test_valid
    assert travel.valid?
  end
end
