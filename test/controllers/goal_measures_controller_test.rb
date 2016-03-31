require 'test_helper'

class GoalMeasuresControllerTest < ActionController::TestCase
  setup do
    @goal_measure = goal_measures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:goal_measures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create goal_measure" do
    assert_difference('GoalMeasure.count') do
      post :create, goal_measure: { name: @goal_measure.name }
    end

    assert_redirected_to goal_measure_path(assigns(:goal_measure))
  end

  test "should show goal_measure" do
    get :show, id: @goal_measure
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @goal_measure
    assert_response :success
  end

  test "should update goal_measure" do
    patch :update, id: @goal_measure, goal_measure: { name: @goal_measure.name }
    assert_redirected_to goal_measure_path(assigns(:goal_measure))
  end

  test "should destroy goal_measure" do
    assert_difference('GoalMeasure.count', -1) do
      delete :destroy, id: @goal_measure
    end

    assert_redirected_to goal_measures_path
  end
end
