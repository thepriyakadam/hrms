require 'test_helper'

class InstalmentsControllerTest < ActionController::TestCase
  setup do
    @instalment = instalments(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:instalments)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create instalment' do
    assert_difference('Instalment.count') do
      post :create, instalment: { advance_salary_id: @instalment.advance_salary_id, instalment_amount: @instalment.instalment_amount, instalment_date: @instalment.instalment_date }
    end

    assert_redirected_to instalment_path(assigns(:instalment))
  end

  test 'should show instalment' do
    get :show, id: @instalment
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @instalment
    assert_response :success
  end

  test 'should update instalment' do
    patch :update, id: @instalment, instalment: { advance_salary_id: @instalment.advance_salary_id, instalment_amount: @instalment.instalment_amount, instalment_date: @instalment.instalment_date }
    assert_redirected_to instalment_path(assigns(:instalment))
  end

  test 'should destroy instalment' do
    assert_difference('Instalment.count', -1) do
      delete :destroy, id: @instalment
    end

    assert_redirected_to instalments_path
  end
end
