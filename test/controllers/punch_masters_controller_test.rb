require 'test_helper'

class PunchMastersControllerTest < ActionController::TestCase
  setup do
    @punch_master = punch_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:punch_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create punch_master" do
    assert_difference('PunchMaster.count') do
      post :create, punch_master: { end_time: @punch_master.end_time, full_day_hrs: @punch_master.full_day_hrs, half_day_hrs: @punch_master.half_day_hrs, reader_in: @punch_master.reader_in, reader_out: @punch_master.reader_out, start_time: @punch_master.start_time, status: @punch_master.status }
    end

    assert_redirected_to punch_master_path(assigns(:punch_master))
  end

  test "should show punch_master" do
    get :show, id: @punch_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @punch_master
    assert_response :success
  end

  test "should update punch_master" do
    patch :update, id: @punch_master, punch_master: { end_time: @punch_master.end_time, full_day_hrs: @punch_master.full_day_hrs, half_day_hrs: @punch_master.half_day_hrs, reader_in: @punch_master.reader_in, reader_out: @punch_master.reader_out, start_time: @punch_master.start_time, status: @punch_master.status }
    assert_redirected_to punch_master_path(assigns(:punch_master))
  end

  test "should destroy punch_master" do
    assert_difference('PunchMaster.count', -1) do
      delete :destroy, id: @punch_master
    end

    assert_redirected_to punch_masters_path
  end
end
