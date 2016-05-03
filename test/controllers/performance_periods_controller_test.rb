require 'test_helper'

class PerformancePeriodsControllerTest < ActionController::TestCase
  setup do
    @performance_period = performance_periods(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:performance_periods)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create performance_period' do
    assert_difference('PerformancePeriod.count') do
      post :create, performance_period: { description: @performance_period.description, end_date: @performance_period.end_date, is_open: @performance_period.is_open, start_date: @performance_period.start_date, title: @performance_period.title }
    end

    assert_redirected_to performance_period_path(assigns(:performance_period))
  end

  test 'should show performance_period' do
    get :show, id: @performance_period
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @performance_period
    assert_response :success
  end

  test 'should update performance_period' do
    patch :update, id: @performance_period, performance_period: { description: @performance_period.description, end_date: @performance_period.end_date, is_open: @performance_period.is_open, start_date: @performance_period.start_date, title: @performance_period.title }
    assert_redirected_to performance_period_path(assigns(:performance_period))
  end

  test 'should destroy performance_period' do
    assert_difference('PerformancePeriod.count', -1) do
      delete :destroy, id: @performance_period
    end

    assert_redirected_to performance_periods_path
  end
end
