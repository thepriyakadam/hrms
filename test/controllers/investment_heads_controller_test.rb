require 'test_helper'

class InvestmentHeadsControllerTest < ActionController::TestCase
  setup do
    @investment_head = investment_heads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:investment_heads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create investment_head" do
    assert_difference('InvestmentHead.count') do
      post :create, investment_head: { description: @investment_head.description, limit: @investment_head.limit, section_id: @investment_head.section_id }
    end

    assert_redirected_to investment_head_path(assigns(:investment_head))
  end

  test "should show investment_head" do
    get :show, id: @investment_head
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @investment_head
    assert_response :success
  end

  test "should update investment_head" do
    patch :update, id: @investment_head, investment_head: { description: @investment_head.description, limit: @investment_head.limit, section_id: @investment_head.section_id }
    assert_redirected_to investment_head_path(assigns(:investment_head))
  end

  test "should destroy investment_head" do
    assert_difference('InvestmentHead.count', -1) do
      delete :destroy, id: @investment_head
    end

    assert_redirected_to investment_heads_path
  end
end
