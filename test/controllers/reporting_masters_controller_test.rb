require 'test_helper'

class ReportingMastersControllerTest < ActionController::TestCase
  setup do
    @reporting_master = reporting_masters(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:reporting_masters)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create reporting_master' do
    assert_difference('ReportingMaster.count') do
      post :create, reporting_master: { code: @reporting_master.code, description: @reporting_master.description, employee_id: @reporting_master.employee_id, name: @reporting_master.name }
    end

    assert_redirected_to reporting_master_path(assigns(:reporting_master))
  end

  test 'should show reporting_master' do
    get :show, id: @reporting_master
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @reporting_master
    assert_response :success
  end

  test 'should update reporting_master' do
    patch :update, id: @reporting_master, reporting_master: { code: @reporting_master.code, description: @reporting_master.description, employee_id: @reporting_master.employee_id, name: @reporting_master.name }
    assert_redirected_to reporting_master_path(assigns(:reporting_master))
  end

  test 'should destroy reporting_master' do
    assert_difference('ReportingMaster.count', -1) do
      delete :destroy, id: @reporting_master
    end

    assert_redirected_to reporting_masters_path
  end
end
