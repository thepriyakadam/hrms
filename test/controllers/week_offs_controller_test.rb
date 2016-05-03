require 'test_helper'

class WeekOffsControllerTest < ActionController::TestCase
  setup do
    @week_off = week_offs(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:week_offs)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create week_off' do
    assert_difference('WeekOff.count') do
      post :create, week_off: { employee_id: @week_off.employee_id, weekoff_date_range: @week_off.weekoff_date_range }
    end

    assert_redirected_to week_off_path(assigns(:week_off))
  end

  test 'should show week_off' do
    get :show, id: @week_off
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @week_off
    assert_response :success
  end

  test 'should update week_off' do
    patch :update, id: @week_off, week_off: { employee_id: @week_off.employee_id, weekoff_date_range: @week_off.weekoff_date_range }
    assert_redirected_to week_off_path(assigns(:week_off))
  end

  test 'should destroy week_off' do
    assert_difference('WeekOff.count', -1) do
      delete :destroy, id: @week_off
    end

    assert_redirected_to week_offs_path
  end
end
