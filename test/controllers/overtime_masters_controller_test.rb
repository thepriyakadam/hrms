require 'test_helper'

class OvertimeMastersControllerTest < ActionController::TestCase
  setup do
    @overtime_master = overtime_masters(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:overtime_masters)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create overtime_master' do
    assert_difference('OvertimeMaster.count') do
      post :create, overtime_master: { company_hrs: @overtime_master.company_hrs, day: @overtime_master.day, is_esic: @overtime_master.is_esic, is_over_time: @overtime_master.is_over_time, ot_rate: @overtime_master.ot_rate, status: @overtime_master.status }
    end

    assert_redirected_to overtime_master_path(assigns(:overtime_master))
  end

  test 'should show overtime_master' do
    get :show, id: @overtime_master
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @overtime_master
    assert_response :success
  end

  test 'should update overtime_master' do
    patch :update, id: @overtime_master, overtime_master: { company_hrs: @overtime_master.company_hrs, day: @overtime_master.day, is_esic: @overtime_master.is_esic, is_over_time: @overtime_master.is_over_time, ot_rate: @overtime_master.ot_rate, status: @overtime_master.status }
    assert_redirected_to overtime_master_path(assigns(:overtime_master))
  end

  test 'should destroy overtime_master' do
    assert_difference('OvertimeMaster.count', -1) do
      delete :destroy, id: @overtime_master
    end

    assert_redirected_to overtime_masters_path
  end
end
