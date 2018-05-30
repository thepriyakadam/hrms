require 'test_helper'

class ReimbursementHeadsControllerTest < ActionController::TestCase
  setup do
    @reimbursement_head = reimbursement_heads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reimbursement_heads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reimbursement_head" do
    assert_difference('ReimbursementHead.count') do
      post :create, reimbursement_head: { code: @reimbursement_head.code, description: @reimbursement_head.description, name: @reimbursement_head.name, status: @reimbursement_head.status }
    end

    assert_redirected_to reimbursement_head_path(assigns(:reimbursement_head))
  end

  test "should show reimbursement_head" do
    get :show, id: @reimbursement_head
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reimbursement_head
    assert_response :success
  end

  test "should update reimbursement_head" do
    patch :update, id: @reimbursement_head, reimbursement_head: { code: @reimbursement_head.code, description: @reimbursement_head.description, name: @reimbursement_head.name, status: @reimbursement_head.status }
    assert_redirected_to reimbursement_head_path(assigns(:reimbursement_head))
  end

  test "should destroy reimbursement_head" do
    assert_difference('ReimbursementHead.count', -1) do
      delete :destroy, id: @reimbursement_head
    end

    assert_redirected_to reimbursement_heads_path
  end
end
