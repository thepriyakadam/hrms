require 'test_helper'

class ExperincesControllerTest < ActionController::TestCase
  setup do
    @experince = experinces(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:experinces)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create experince' do
    assert_difference('Experince.count') do
      post :create, experince: { company_name: @experince.company_name, ctc: @experince.ctc, designation: @experince.designation, employee_id: @experince.employee_id, no_of_year_experince: @experince.no_of_year_experince }
    end

    assert_redirected_to experince_path(assigns(:experince))
  end

  test 'should show experince' do
    get :show, id: @experince
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @experince
    assert_response :success
  end

  test 'should update experince' do
    patch :update, id: @experince, experince: { company_name: @experince.company_name, ctc: @experince.ctc, designation: @experince.designation, employee_id: @experince.employee_id, no_of_year_experince: @experince.no_of_year_experince }
    assert_redirected_to experince_path(assigns(:experince))
  end

  test 'should destroy experince' do
    assert_difference('Experince.count', -1) do
      delete :destroy, id: @experince
    end

    assert_redirected_to experinces_path
  end
end
