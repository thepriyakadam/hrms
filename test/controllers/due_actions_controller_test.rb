require 'test_helper'

class DueActionsControllerTest < ActionController::TestCase
  setup do
    @due_action = due_actions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:due_actions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create due_action" do
    assert_difference('DueAction.count') do
      post :create, due_action: { amount: @due_action.amount, due_detail_id: @due_action.due_detail_id, name: @due_action.name, remark: @due_action.remark }
    end

    assert_redirected_to due_action_path(assigns(:due_action))
  end

  test "should show due_action" do
    get :show, id: @due_action
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @due_action
    assert_response :success
  end

  test "should update due_action" do
    patch :update, id: @due_action, due_action: { amount: @due_action.amount, due_detail_id: @due_action.due_detail_id, name: @due_action.name, remark: @due_action.remark }
    assert_redirected_to due_action_path(assigns(:due_action))
  end

  test "should destroy due_action" do
    assert_difference('DueAction.count', -1) do
      delete :destroy, id: @due_action
    end

    assert_redirected_to due_actions_path
  end
end
