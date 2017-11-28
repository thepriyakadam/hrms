require 'test_helper'

class EmployeePromotionsControllerTest < ActionController::TestCase
  setup do
    @employee_promotion = employee_promotions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employee_promotions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employee_promotion" do
    assert_difference('EmployeePromotion.count') do
      post :create, employee_promotion: { department_id: @employee_promotion.department_id, effective_from: @employee_promotion.effective_from, effective_to: @employee_promotion.effective_to, employee_category_id: @employee_promotion.employee_category_id, employee_ctc: @employee_promotion.employee_ctc, employee_designation_id: @employee_promotion.employee_designation_id, employee_grade_id: @employee_promotion.employee_grade_id, employee_id: @employee_promotion.employee_id, justification: @employee_promotion.justification }
    end

    assert_redirected_to employee_promotion_path(assigns(:employee_promotion))
  end

  test "should show employee_promotion" do
    get :show, id: @employee_promotion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employee_promotion
    assert_response :success
  end

  test "should update employee_promotion" do
    patch :update, id: @employee_promotion, employee_promotion: { department_id: @employee_promotion.department_id, effective_from: @employee_promotion.effective_from, effective_to: @employee_promotion.effective_to, employee_category_id: @employee_promotion.employee_category_id, employee_ctc: @employee_promotion.employee_ctc, employee_designation_id: @employee_promotion.employee_designation_id, employee_grade_id: @employee_promotion.employee_grade_id, employee_id: @employee_promotion.employee_id, justification: @employee_promotion.justification }
    assert_redirected_to employee_promotion_path(assigns(:employee_promotion))
  end

  test "should destroy employee_promotion" do
    assert_difference('EmployeePromotion.count', -1) do
      delete :destroy, id: @employee_promotion
    end

    assert_redirected_to employee_promotions_path
  end
end
