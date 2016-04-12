require 'test_helper'

class ParticularLeaveRecordsControllerTest < ActionController::TestCase
  test 'should get show_leave_record' do
    get :show_leave_record
    assert_response :success
  end
end
