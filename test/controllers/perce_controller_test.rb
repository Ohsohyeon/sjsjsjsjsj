require 'test_helper'

class PerceControllerTest < ActionController::TestCase
  test "should get lists" do
    get :lists
    assert_response :success
  end

end
