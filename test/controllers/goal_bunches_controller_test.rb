require 'test_helper'

class GoalBunchesControllerTest < ActionController::TestCase
  setup do
    @goal_bunch = goal_bunches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:goal_bunches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create goal_bunch" do
    assert_difference('GoalBunch.count') do
      post :create, goal_bunch: { appraisee_comment: @goal_bunch.appraisee_comment, appraisee_confirm: @goal_bunch.appraisee_confirm, appraisee_id: @goal_bunch.appraisee_id, appraiser_comment: @goal_bunch.appraiser_comment, appraiser_confirm: @goal_bunch.appraiser_confirm, appraiser_id: @goal_bunch.appraiser_id, appraiser_rating: @goal_bunch.appraiser_rating, employee_id: @goal_bunch.employee_id, final_comment: @goal_bunch.final_comment, final_confirm: @goal_bunch.final_confirm, final_id: @goal_bunch.final_id, final_rating_id: @goal_bunch.final_rating_id, period_id: @goal_bunch.period_id, reviewer_comment_id: @goal_bunch.reviewer_comment_id, reviewer_confirm: @goal_bunch.reviewer_confirm, reviewer_id: @goal_bunch.reviewer_id, reviewer_rating_id: @goal_bunch.reviewer_rating_id }
    end

    assert_redirected_to goal_bunch_path(assigns(:goal_bunch))
  end

  test "should show goal_bunch" do
    get :show, id: @goal_bunch
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @goal_bunch
    assert_response :success
  end

  test "should update goal_bunch" do
    patch :update, id: @goal_bunch, goal_bunch: { appraisee_comment: @goal_bunch.appraisee_comment, appraisee_confirm: @goal_bunch.appraisee_confirm, appraisee_id: @goal_bunch.appraisee_id, appraiser_comment: @goal_bunch.appraiser_comment, appraiser_confirm: @goal_bunch.appraiser_confirm, appraiser_id: @goal_bunch.appraiser_id, appraiser_rating: @goal_bunch.appraiser_rating, employee_id: @goal_bunch.employee_id, final_comment: @goal_bunch.final_comment, final_confirm: @goal_bunch.final_confirm, final_id: @goal_bunch.final_id, final_rating_id: @goal_bunch.final_rating_id, period_id: @goal_bunch.period_id, reviewer_comment_id: @goal_bunch.reviewer_comment_id, reviewer_confirm: @goal_bunch.reviewer_confirm, reviewer_id: @goal_bunch.reviewer_id, reviewer_rating_id: @goal_bunch.reviewer_rating_id }
    assert_redirected_to goal_bunch_path(assigns(:goal_bunch))
  end

  test "should destroy goal_bunch" do
    assert_difference('GoalBunch.count', -1) do
      delete :destroy, id: @goal_bunch
    end

    assert_redirected_to goal_bunches_path
  end
end
