require 'test_helper'

class ExpencessTypesControllerTest < ActionController::TestCase
  setup do
    @expencess_type = expencess_types(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:expencess_types)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create expencess_type' do
    assert_difference('ExpencessType.count') do
      post :create, expencess_type: { code: @expencess_type.code, description: @expencess_type.description, name: @expencess_type.name }
    end

    assert_redirected_to expencess_type_path(assigns(:expencess_type))
  end

  test 'should show expencess_type' do
    get :show, id: @expencess_type
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @expencess_type
    assert_response :success
  end

  test 'should update expencess_type' do
    patch :update, id: @expencess_type, expencess_type: { code: @expencess_type.code, description: @expencess_type.description, name: @expencess_type.name }
    assert_redirected_to expencess_type_path(assigns(:expencess_type))
  end

  test 'should destroy expencess_type' do
    assert_difference('ExpencessType.count', -1) do
      delete :destroy, id: @expencess_type
    end

    assert_redirected_to expencess_types_path
  end
end
