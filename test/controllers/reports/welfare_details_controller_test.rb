require 'test_helper'

class Reports::WelfareDetailsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

end
