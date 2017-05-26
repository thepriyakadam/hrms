require 'test_helper'

class RewardsAllocationsControllerTest < ActionController::TestCase
  setup do
    @rewards_allocation = rewards_allocations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rewards_allocations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rewards_allocation" do
    assert_difference('RewardsAllocation.count') do
      post :create, rewards_allocation: { allocated_qty: @rewards_allocation.allocated_qty, cost: @rewards_allocation.cost, department_id: @rewards_allocation.department_id, from: @rewards_allocation.from, reporting_master_id: @rewards_allocation.reporting_master_id, reward_type_id: @rewards_allocation.reward_type_id, to: @rewards_allocation.to }
    end

    assert_redirected_to rewards_allocation_path(assigns(:rewards_allocation))
  end

  test "should show rewards_allocation" do
    get :show, id: @rewards_allocation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rewards_allocation
    assert_response :success
  end

  test "should update rewards_allocation" do
    patch :update, id: @rewards_allocation, rewards_allocation: { allocated_qty: @rewards_allocation.allocated_qty, cost: @rewards_allocation.cost, department_id: @rewards_allocation.department_id, from: @rewards_allocation.from, reporting_master_id: @rewards_allocation.reporting_master_id, reward_type_id: @rewards_allocation.reward_type_id, to: @rewards_allocation.to }
    assert_redirected_to rewards_allocation_path(assigns(:rewards_allocation))
  end

  test "should destroy rewards_allocation" do
    assert_difference('RewardsAllocation.count', -1) do
      delete :destroy, id: @rewards_allocation
    end

    assert_redirected_to rewards_allocations_path
  end
end
