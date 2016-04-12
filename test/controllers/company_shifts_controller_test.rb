require 'test_helper'

class CompanyShiftsControllerTest < ActionController::TestCase
  setup do
    @company_shift = company_shifts(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:company_shifts)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create company_shift' do
    assert_difference('CompanyShift.count') do
      post :create, company_shift: { in_time: @company_shift.in_time, name: @company_shift.name, out_time: @company_shift.out_time }
    end

    assert_redirected_to company_shift_path(assigns(:company_shift))
  end

  test 'should show company_shift' do
    get :show, id: @company_shift
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @company_shift
    assert_response :success
  end

  test 'should update company_shift' do
    patch :update, id: @company_shift, company_shift: { in_time: @company_shift.in_time, name: @company_shift.name, out_time: @company_shift.out_time }
    assert_redirected_to company_shift_path(assigns(:company_shift))
  end

  test 'should destroy company_shift' do
    assert_difference('CompanyShift.count', -1) do
      delete :destroy, id: @company_shift
    end

    assert_redirected_to company_shifts_path
  end
end
