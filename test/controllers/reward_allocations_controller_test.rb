require 'test_helper'

class RewardAllocationsControllerTest < ActionController::TestCase
  setup do
    @reward_allocation = reward_allocations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reward_allocations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reward_allocation" do
    assert_difference('RewardAllocation.count') do
      post :create, reward_allocation: { code: @reward_allocation.code, description: @reward_allocation.description, name: @reward_allocation.name, status: @reward_allocation.status }
    end

    assert_redirected_to reward_allocation_path(assigns(:reward_allocation))
  end

  test "should show reward_allocation" do
    get :show, id: @reward_allocation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reward_allocation
    assert_response :success
  end

  test "should update reward_allocation" do
    patch :update, id: @reward_allocation, reward_allocation: { code: @reward_allocation.code, description: @reward_allocation.description, name: @reward_allocation.name, status: @reward_allocation.status }
    assert_redirected_to reward_allocation_path(assigns(:reward_allocation))
  end

  test "should destroy reward_allocation" do
    assert_difference('RewardAllocation.count', -1) do
      delete :destroy, id: @reward_allocation
    end

    assert_redirected_to reward_allocations_path
  end
end
