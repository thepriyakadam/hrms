require 'test_helper'

class GoalPerspectivesControllerTest < ActionController::TestCase
  setup do
    @goal_perspective = goal_perspectives(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:goal_perspectives)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create goal_perspective" do
    assert_difference('GoalPerspective.count') do
      post :create, goal_perspective: { name: @goal_perspective.name }
    end

    assert_redirected_to goal_perspective_path(assigns(:goal_perspective))
  end

  test "should show goal_perspective" do
    get :show, id: @goal_perspective
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @goal_perspective
    assert_response :success
  end

  test "should update goal_perspective" do
    patch :update, id: @goal_perspective, goal_perspective: { name: @goal_perspective.name }
    assert_redirected_to goal_perspective_path(assigns(:goal_perspective))
  end

  test "should destroy goal_perspective" do
    assert_difference('GoalPerspective.count', -1) do
      delete :destroy, id: @goal_perspective
    end

    assert_redirected_to goal_perspectives_path
  end
end
