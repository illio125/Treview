require "test_helper"

class CollectionTest < ActiveSupport::TestCase
  def collection
    @collection ||= Collection.new
  end

  def test_valid
    assert collection.valid?
  end
end
