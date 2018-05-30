require 'test_helper'

class GoalRatingsControllerTest < ActionController::TestCase
  setup do
    @goal_rating = goal_ratings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:goal_ratings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create goal_rating" do
    assert_difference('GoalRating.count') do
      post :create, goal_rating: { aligned: @goal_rating.aligned, appraisee_comment: @goal_rating.appraisee_comment, appraisee_id: @goal_rating.appraisee_id, appraiser_comment: @goal_rating.appraiser_comment, appraiser_id: @goal_rating.appraiser_id, appraiser_rating_id: @goal_rating.appraiser_rating_id, goal_bunch_id: @goal_rating.goal_bunch_id, goal_measure: @goal_rating.goal_measure, goal_perspective_id: @goal_rating.goal_perspective_id, goal_setter_id: @goal_rating.goal_setter_id, goal_weightage: @goal_rating.goal_weightage, reviewer_comment: @goal_rating.reviewer_comment, reviewer_id: @goal_rating.reviewer_id, target: @goal_rating.target }
    end

    assert_redirected_to goal_rating_path(assigns(:goal_rating))
  end

  test "should show goal_rating" do
    get :show, id: @goal_rating
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @goal_rating
    assert_response :success
  end

  test "should update goal_rating" do
    patch :update, id: @goal_rating, goal_rating: { aligned: @goal_rating.aligned, appraisee_comment: @goal_rating.appraisee_comment, appraisee_id: @goal_rating.appraisee_id, appraiser_comment: @goal_rating.appraiser_comment, appraiser_id: @goal_rating.appraiser_id, appraiser_rating_id: @goal_rating.appraiser_rating_id, goal_bunch_id: @goal_rating.goal_bunch_id, goal_measure: @goal_rating.goal_measure, goal_perspective_id: @goal_rating.goal_perspective_id, goal_setter_id: @goal_rating.goal_setter_id, goal_weightage: @goal_rating.goal_weightage, reviewer_comment: @goal_rating.reviewer_comment, reviewer_id: @goal_rating.reviewer_id, target: @goal_rating.target }
    assert_redirected_to goal_rating_path(assigns(:goal_rating))
  end

  test "should destroy goal_rating" do
    assert_difference('GoalRating.count', -1) do
      delete :destroy, id: @goal_rating
    end

    assert_redirected_to goal_ratings_path
  end
end
