require 'test_helper'

class RewardOwnersControllerTest < ActionController::TestCase
  setup do
    @reward_owner = reward_owners(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reward_owners)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reward_owner" do
    assert_difference('RewardOwner.count') do
      post :create, reward_owner: { code: @reward_owner.code, description: @reward_owner.description, name: @reward_owner.name, status: @reward_owner.status }
    end

    assert_redirected_to reward_owner_path(assigns(:reward_owner))
  end

  test "should show reward_owner" do
    get :show, id: @reward_owner
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reward_owner
    assert_response :success
  end

  test "should update reward_owner" do
    patch :update, id: @reward_owner, reward_owner: { code: @reward_owner.code, description: @reward_owner.description, name: @reward_owner.name, status: @reward_owner.status }
    assert_redirected_to reward_owner_path(assigns(:reward_owner))
  end

  test "should destroy reward_owner" do
    assert_difference('RewardOwner.count', -1) do
      delete :destroy, id: @reward_owner
    end

    assert_redirected_to reward_owners_path
  end
end
