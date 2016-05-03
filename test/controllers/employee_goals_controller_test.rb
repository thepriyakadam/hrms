require 'test_helper'

class EmployeeGoalsControllerTest < ActionController::TestCase
  setup do
    @employee_goal = employee_goals(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:employee_goals)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create employee_goal' do
    assert_difference('EmployeeGoal.count') do
      post :create, employee_goal: { allign_to_supervisor: @employee_goal.allign_to_supervisor, appraisee_comment: @employee_goal.appraisee_comment, appraisee_id: @employee_goal.appraisee_id, appraisee_rating: @employee_goal.appraisee_rating, appraiser_comment: @employee_goal.appraiser_comment, appraiser_id: @employee_goal.appraiser_id, appraiser_rating: @employee_goal.appraiser_rating, difficulty_level: @employee_goal.difficulty_level, goal_measure_id: @employee_goal.goal_measure_id, goal_perspective_id: @employee_goal.goal_perspective_id, goal_weightage: @employee_goal.goal_weightage, target: @employee_goal.target }
    end

    assert_redirected_to employee_goal_path(assigns(:employee_goal))
  end

  test 'should show employee_goal' do
    get :show, id: @employee_goal
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @employee_goal
    assert_response :success
  end

  test 'should update employee_goal' do
    patch :update, id: @employee_goal, employee_goal: { allign_to_supervisor: @employee_goal.allign_to_supervisor, appraisee_comment: @employee_goal.appraisee_comment, appraisee_id: @employee_goal.appraisee_id, appraisee_rating: @employee_goal.appraisee_rating, appraiser_comment: @employee_goal.appraiser_comment, appraiser_id: @employee_goal.appraiser_id, appraiser_rating: @employee_goal.appraiser_rating, difficulty_level: @employee_goal.difficulty_level, goal_measure_id: @employee_goal.goal_measure_id, goal_perspective_id: @employee_goal.goal_perspective_id, goal_weightage: @employee_goal.goal_weightage, target: @employee_goal.target }
    assert_redirected_to employee_goal_path(assigns(:employee_goal))
  end

  test 'should destroy employee_goal' do
    assert_difference('EmployeeGoal.count', -1) do
      delete :destroy, id: @employee_goal
    end

    assert_redirected_to employee_goals_path
  end
end
