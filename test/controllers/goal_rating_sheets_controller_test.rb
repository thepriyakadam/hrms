require 'test_helper'

class GoalRatingSheetsControllerTest < ActionController::TestCase
  setup do
    @goal_rating_sheet = goal_rating_sheets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:goal_rating_sheets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create goal_rating_sheet" do
    assert_difference('GoalRatingSheet.count') do
      post :create, goal_rating_sheet: { allign_to_supervisor: @goal_rating_sheet.allign_to_supervisor, appraisee_comment: @goal_rating_sheet.appraisee_comment, appraisee_id: @goal_rating_sheet.appraisee_id, appraisee_rating: @goal_rating_sheet.appraisee_rating, appraiser_comment: @goal_rating_sheet.appraiser_comment, appraiser_id: @goal_rating_sheet.appraiser_id, appraiser_rating: @goal_rating_sheet.appraiser_rating, employee_goal_id: @goal_rating_sheet.employee_goal_id }
    end

    assert_redirected_to goal_rating_sheet_path(assigns(:goal_rating_sheet))
  end

  test "should show goal_rating_sheet" do
    get :show, id: @goal_rating_sheet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @goal_rating_sheet
    assert_response :success
  end

  test "should update goal_rating_sheet" do
    patch :update, id: @goal_rating_sheet, goal_rating_sheet: { allign_to_supervisor: @goal_rating_sheet.allign_to_supervisor, appraisee_comment: @goal_rating_sheet.appraisee_comment, appraisee_id: @goal_rating_sheet.appraisee_id, appraisee_rating: @goal_rating_sheet.appraisee_rating, appraiser_comment: @goal_rating_sheet.appraiser_comment, appraiser_id: @goal_rating_sheet.appraiser_id, appraiser_rating: @goal_rating_sheet.appraiser_rating, employee_goal_id: @goal_rating_sheet.employee_goal_id }
    assert_redirected_to goal_rating_sheet_path(assigns(:goal_rating_sheet))
  end

  test "should destroy goal_rating_sheet" do
    assert_difference('GoalRatingSheet.count', -1) do
      delete :destroy, id: @goal_rating_sheet
    end

    assert_redirected_to goal_rating_sheets_path
  end
end
