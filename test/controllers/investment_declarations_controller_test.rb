require 'test_helper'

class InvestmentDeclarationsControllerTest < ActionController::TestCase
  setup do
    @investment_declaration = investment_declarations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:investment_declarations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create investment_declaration" do
    assert_difference('InvestmentDeclaration.count') do
      post :create, investment_declaration: { amount: @investment_declaration.amount, date: @investment_declaration.date, employee_id: @investment_declaration.employee_id, investment_head_id: @investment_declaration.investment_head_id, status: @investment_declaration.status }
    end

    assert_redirected_to investment_declaration_path(assigns(:investment_declaration))
  end

  test "should show investment_declaration" do
    get :show, id: @investment_declaration
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @investment_declaration
    assert_response :success
  end

  test "should update investment_declaration" do
    patch :update, id: @investment_declaration, investment_declaration: { amount: @investment_declaration.amount, date: @investment_declaration.date, employee_id: @investment_declaration.employee_id, investment_head_id: @investment_declaration.investment_head_id, status: @investment_declaration.status }
    assert_redirected_to investment_declaration_path(assigns(:investment_declaration))
  end

  test "should destroy investment_declaration" do
    assert_difference('InvestmentDeclaration.count', -1) do
      delete :destroy, id: @investment_declaration
    end

    assert_redirected_to investment_declarations_path
  end
end
