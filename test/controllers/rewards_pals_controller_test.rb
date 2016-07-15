require 'test_helper'

class RewardsPalsControllerTest < ActionController::TestCase
  setup do
    @rewards_pal = rewards_pals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rewards_pals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rewards_pal" do
    assert_difference('RewardsPal.count') do
      post :create, rewards_pal: { date: @rewards_pal.date, employee_id: @rewards_pal.employee_id, purpose: @rewards_pal.purpose, qty: @rewards_pal.qty, reporting_master_id: @rewards_pal.reporting_master_id, reward_type_id: @rewards_pal.reward_type_id }
    end

    assert_redirected_to rewards_pal_path(assigns(:rewards_pal))
  end

  test "should show rewards_pal" do
    get :show, id: @rewards_pal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rewards_pal
    assert_response :success
  end

  test "should update rewards_pal" do
    patch :update, id: @rewards_pal, rewards_pal: { date: @rewards_pal.date, employee_id: @rewards_pal.employee_id, purpose: @rewards_pal.purpose, qty: @rewards_pal.qty, reporting_master_id: @rewards_pal.reporting_master_id, reward_type_id: @rewards_pal.reward_type_id }
    assert_redirected_to rewards_pal_path(assigns(:rewards_pal))
  end

  test "should destroy rewards_pal" do
    assert_difference('RewardsPal.count', -1) do
      delete :destroy, id: @rewards_pal
    end

    assert_redirected_to rewards_pals_path
  end
end
