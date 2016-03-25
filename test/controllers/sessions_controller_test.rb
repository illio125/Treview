require "test_helper"

class SessionsControllerTest < ActionController::TestCase
  def test_create
    get :create
    assert_response :success
  end

  def test_destroy
    get :destroy
    assert_response :success
  end

end
