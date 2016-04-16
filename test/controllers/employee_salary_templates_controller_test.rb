require 'test_helper'

class EmployeeSalaryTemplatesControllerTest < ActionController::TestCase
  test 'should get index' do
    get :index
    assert_response :success
  end

  test 'should get _show_employee' do
    get :_show_employee
    assert_response :success
  end

  test 'should get create.js' do
    get :create.js
    assert_response :success
  end
end
