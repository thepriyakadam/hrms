require 'test_helper'

class BonusEmployersControllerTest < ActionController::TestCase
  setup do
    @bonus_employer = bonus_employers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bonus_employers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bonus_employer" do
    assert_difference('BonusEmployer.count') do
      post :create, bonus_employer: { base_component: @bonus_employer.base_component, effective_from: @bonus_employer.effective_from, effective_to: @bonus_employer.effective_to, is_active: @bonus_employer.is_active, is_confirm: @bonus_employer.is_confirm, limit_amount: @bonus_employer.limit_amount, percentage: @bonus_employer.percentage }
    end

    assert_redirected_to bonus_employer_path(assigns(:bonus_employer))
  end

  test "should show bonus_employer" do
    get :show, id: @bonus_employer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bonus_employer
    assert_response :success
  end

  test "should update bonus_employer" do
    patch :update, id: @bonus_employer, bonus_employer: { base_component: @bonus_employer.base_component, effective_from: @bonus_employer.effective_from, effective_to: @bonus_employer.effective_to, is_active: @bonus_employer.is_active, is_confirm: @bonus_employer.is_confirm, limit_amount: @bonus_employer.limit_amount, percentage: @bonus_employer.percentage }
    assert_redirected_to bonus_employer_path(assigns(:bonus_employer))
  end

  test "should destroy bonus_employer" do
    assert_difference('BonusEmployer.count', -1) do
      delete :destroy, id: @bonus_employer
    end

    assert_redirected_to bonus_employers_path
  end
end
