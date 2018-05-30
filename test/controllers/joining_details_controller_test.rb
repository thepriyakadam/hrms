require 'test_helper'

class JoiningDetailsControllerTest < ActionController::TestCase
  setup do
    @joining_detail = joining_details(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:joining_details)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create joining_detail' do
    assert_difference('JoiningDetail.count') do
      post :create, joining_detail: { account_no: @joining_detail.account_no, admin_hr: @joining_detail.admin_hr, confirmation_date: @joining_detail.confirmation_date, ctc: @joining_detail.ctc, designation: @joining_detail.designation, employee_grade_id: @joining_detail.employee_grade_id, employee_id: @joining_detail.employee_id, joining_date: @joining_detail.joining_date, medical_schem: @joining_detail.medical_schem, notice_period: @joining_detail.notice_period, probation_period: @joining_detail.probation_period, reffernce_from: @joining_detail.reffernce_from, status: @joining_detail.status, tech_hr: @joining_detail.tech_hr }
    end

    assert_redirected_to joining_detail_path(assigns(:joining_detail))
  end

  test 'should show joining_detail' do
    get :show, id: @joining_detail
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @joining_detail
    assert_response :success
  end

  test 'should update joining_detail' do
    patch :update, id: @joining_detail, joining_detail: { account_no: @joining_detail.account_no, admin_hr: @joining_detail.admin_hr, confirmation_date: @joining_detail.confirmation_date, ctc: @joining_detail.ctc, designation: @joining_detail.designation, employee_grade_id: @joining_detail.employee_grade_id, employee_id: @joining_detail.employee_id, joining_date: @joining_detail.joining_date, medical_schem: @joining_detail.medical_schem, notice_period: @joining_detail.notice_period, probation_period: @joining_detail.probation_period, reffernce_from: @joining_detail.reffernce_from, status: @joining_detail.status, tech_hr: @joining_detail.tech_hr }
    assert_redirected_to joining_detail_path(assigns(:joining_detail))
  end

  test 'should destroy joining_detail' do
    assert_difference('JoiningDetail.count', -1) do
      delete :destroy, id: @joining_detail
    end

    assert_redirected_to joining_details_path
  end
end
