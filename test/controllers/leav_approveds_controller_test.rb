require 'test_helper'

class LeavApprovedsControllerTest < ActionController::TestCase
  setup do
    @leav_approved = leav_approveds(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:leav_approveds)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create leav_approved' do
    assert_difference('LeavApproved.count') do
      post :create, leav_approved: { approved_date: @leav_approved.approved_date, employee_leav_request_id: @leav_approved.employee_leav_request_id }
    end

    assert_redirected_to leav_approved_path(assigns(:leav_approved))
  end

  test 'should show leav_approved' do
    get :show, id: @leav_approved
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @leav_approved
    assert_response :success
  end

  test 'should update leav_approved' do
    patch :update, id: @leav_approved, leav_approved: { approved_date: @leav_approved.approved_date, employee_leav_request_id: @leav_approved.employee_leav_request_id }
    assert_redirected_to leav_approved_path(assigns(:leav_approved))
  end

  test 'should destroy leav_approved' do
    assert_difference('LeavApproved.count', -1) do
      delete :destroy, id: @leav_approved
    end

    assert_redirected_to leav_approveds_path
  end
end
