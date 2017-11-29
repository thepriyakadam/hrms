require 'test_helper'

class RembursmentsControllerTest < ActionController::TestCase
  setup do
    @rembursment = rembursments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rembursments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rembursment" do
    assert_difference('Rembursment.count') do
      post :create, rembursment: { amount: @rembursment.amount, application_date: @rembursment.application_date, employee_id: @rembursment.employee_id, manager_id: @rembursment.manager_id, paid_date: @rembursment.paid_date, rembursment_date: @rembursment.rembursment_date, rembursmentmaster_id: @rembursment.rembursmentmaster_id, status: @rembursment.status }
    end

    assert_redirected_to rembursment_path(assigns(:rembursment))
  end

  test "should show rembursment" do
    get :show, id: @rembursment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rembursment
    assert_response :success
  end

  test "should update rembursment" do
    patch :update, id: @rembursment, rembursment: { amount: @rembursment.amount, application_date: @rembursment.application_date, employee_id: @rembursment.employee_id, manager_id: @rembursment.manager_id, paid_date: @rembursment.paid_date, rembursment_date: @rembursment.rembursment_date, rembursmentmaster_id: @rembursment.rembursmentmaster_id, status: @rembursment.status }
    assert_redirected_to rembursment_path(assigns(:rembursment))
  end

  test "should destroy rembursment" do
    assert_difference('Rembursment.count', -1) do
      delete :destroy, id: @rembursment
    end

    assert_redirected_to rembursments_path
  end
end
