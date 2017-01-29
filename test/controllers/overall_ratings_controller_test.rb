require 'test_helper'

class OverallRatingsControllerTest < ActionController::TestCase
  setup do
    @overall_rating = overall_ratings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:overall_ratings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create overall_rating" do
    assert_difference('OverallRating.count') do
      post :create, overall_rating: { appraisee_comment: @overall_rating.appraisee_comment, employee_id: @overall_rating.employee_id, final_comment: @overall_rating.final_comment, final_ctc: @overall_rating.final_ctc, final_id: @overall_rating.final_id, final_rating_id: @overall_rating.final_rating_id, goal_rating_sheet_id: @overall_rating.goal_rating_sheet_id, increment: @overall_rating.increment, promotion: @overall_rating.promotion, ro1_comment: @overall_rating.ro1_comment, ro1_id: @overall_rating.ro1_id, ro1_rating_id: @overall_rating.ro1_rating_id, ro2_comment: @overall_rating.ro2_comment, ro2_id: @overall_rating.ro2_id, ro2_rating_id: @overall_rating.ro2_rating_id }
    end

    assert_redirected_to overall_rating_path(assigns(:overall_rating))
  end

  test "should show overall_rating" do
    get :show, id: @overall_rating
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @overall_rating
    assert_response :success
  end

  test "should update overall_rating" do
    patch :update, id: @overall_rating, overall_rating: { appraisee_comment: @overall_rating.appraisee_comment, employee_id: @overall_rating.employee_id, final_comment: @overall_rating.final_comment, final_ctc: @overall_rating.final_ctc, final_id: @overall_rating.final_id, final_rating_id: @overall_rating.final_rating_id, goal_rating_sheet_id: @overall_rating.goal_rating_sheet_id, increment: @overall_rating.increment, promotion: @overall_rating.promotion, ro1_comment: @overall_rating.ro1_comment, ro1_id: @overall_rating.ro1_id, ro1_rating_id: @overall_rating.ro1_rating_id, ro2_comment: @overall_rating.ro2_comment, ro2_id: @overall_rating.ro2_id, ro2_rating_id: @overall_rating.ro2_rating_id }
    assert_redirected_to overall_rating_path(assigns(:overall_rating))
  end

  test "should destroy overall_rating" do
    assert_difference('OverallRating.count', -1) do
      delete :destroy, id: @overall_rating
    end

    assert_redirected_to overall_ratings_path
  end
end
