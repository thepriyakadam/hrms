require 'test_helper'

class CompanyLeavsControllerTest < ActionController::TestCase
  setup do
    @company_leav = company_leavs(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:company_leavs)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create company_leav' do
    assert_difference('CompanyLeav.count') do
      post :create, company_leav: { employee_grade_id: @company_leav.employee_grade_id, expire_date: @company_leav.expire_date, no_of_leave: @company_leav.no_of_leave }
    end

    assert_redirected_to company_leav_path(assigns(:company_leav))
  end

  test 'should show company_leav' do
    get :show, id: @company_leav
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @company_leav
    assert_response :success
  end

  test 'should update company_leav' do
    patch :update, id: @company_leav, company_leav: { employee_grade_id: @company_leav.employee_grade_id, expire_date: @company_leav.expire_date, no_of_leave: @company_leav.no_of_leave }
    assert_redirected_to company_leav_path(assigns(:company_leav))
  end

  test 'should destroy company_leav' do
    assert_difference('CompanyLeav.count', -1) do
      delete :destroy, id: @company_leav
    end

    assert_redirected_to company_leavs_path
  end
end
