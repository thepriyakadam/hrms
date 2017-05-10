require 'test_helper'

class EmployeeNominationsControllerTest < ActionController::TestCase
  setup do
    @employee_nomination = employee_nominations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employee_nominations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employee_nomination" do
    assert_difference('EmployeeNomination.count') do
      post :create, employee_nomination: { address: @employee_nomination.address, city: @employee_nomination.city, contry_id: @employee_nomination.contry_id, district_id: @employee_nomination.district_id, email: @employee_nomination.email, family_id: @employee_nomination.family_id, guardian_name: @employee_nomination.guardian_name, mental_illness: @employee_nomination.mental_illness, minor: @employee_nomination.minor, mobile_no: @employee_nomination.mobile_no, nomination: @employee_nomination.nomination, nominational_master_id: @employee_nomination.nominational_master_id, phone_no: @employee_nomination.phone_no, pin_code: @employee_nomination.pin_code, relation_id: @employee_nomination.relation_id, same_address: @employee_nomination.same_address, state_id: @employee_nomination.state_id }
    end

    assert_redirected_to employee_nomination_path(assigns(:employee_nomination))
  end

  test "should show employee_nomination" do
    get :show, id: @employee_nomination
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employee_nomination
    assert_response :success
  end

  test "should update employee_nomination" do
    patch :update, id: @employee_nomination, employee_nomination: { address: @employee_nomination.address, city: @employee_nomination.city, contry_id: @employee_nomination.contry_id, district_id: @employee_nomination.district_id, email: @employee_nomination.email, family_id: @employee_nomination.family_id, guardian_name: @employee_nomination.guardian_name, mental_illness: @employee_nomination.mental_illness, minor: @employee_nomination.minor, mobile_no: @employee_nomination.mobile_no, nomination: @employee_nomination.nomination, nominational_master_id: @employee_nomination.nominational_master_id, phone_no: @employee_nomination.phone_no, pin_code: @employee_nomination.pin_code, relation_id: @employee_nomination.relation_id, same_address: @employee_nomination.same_address, state_id: @employee_nomination.state_id }
    assert_redirected_to employee_nomination_path(assigns(:employee_nomination))
  end

  test "should destroy employee_nomination" do
    assert_difference('EmployeeNomination.count', -1) do
      delete :destroy, id: @employee_nomination
    end

    assert_redirected_to employee_nominations_path
  end
end
