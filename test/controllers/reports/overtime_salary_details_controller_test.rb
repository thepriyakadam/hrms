require 'test_helper'

class Reports::OvertimeSalaryDetailsControllerTest < ActionController::TestCase
  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should get daily' do
    get :daily
    assert_response :success
  end
end
