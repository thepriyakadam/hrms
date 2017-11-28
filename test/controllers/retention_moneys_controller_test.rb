require 'test_helper'

class RetentionMoneysControllerTest < ActionController::TestCase
  setup do
    @retention_money = retention_moneys(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:retention_moneys)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create retention_money' do
    assert_difference('RetentionMoney.count') do
      post :create, retention_money: { amount: @retention_money.amount, description: @retention_money.description, have_retention: @retention_money.have_retention, no_of_month: @retention_money.no_of_month }
    end

    assert_redirected_to retention_money_path(assigns(:retention_money))
  end

  test 'should show retention_money' do
    get :show, id: @retention_money
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @retention_money
    assert_response :success
  end

  test 'should update retention_money' do
    patch :update, id: @retention_money, retention_money: { amount: @retention_money.amount, description: @retention_money.description, have_retention: @retention_money.have_retention, no_of_month: @retention_money.no_of_month }
    assert_redirected_to retention_money_path(assigns(:retention_money))
  end

  test 'should destroy retention_money' do
    assert_difference('RetentionMoney.count', -1) do
      delete :destroy, id: @retention_money
    end

    assert_redirected_to retention_moneys_path
  end
end
