require 'test_helper'

class AdvanceTypesControllerTest < ActionController::TestCase
  setup do
    @advance_type = advance_types(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:advance_types)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create advance_type' do
    assert_difference('AdvanceType.count') do
      post :create, advance_type: { code: @advance_type.code, description: @advance_type.description, name: @advance_type.name }
    end

    assert_redirected_to advance_type_path(assigns(:advance_type))
  end

  test 'should show advance_type' do
    get :show, id: @advance_type
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @advance_type
    assert_response :success
  end

  test 'should update advance_type' do
    patch :update, id: @advance_type, advance_type: { code: @advance_type.code, description: @advance_type.description, name: @advance_type.name }
    assert_redirected_to advance_type_path(assigns(:advance_type))
  end

  test 'should destroy advance_type' do
    assert_difference('AdvanceType.count', -1) do
      delete :destroy, id: @advance_type
    end

    assert_redirected_to advance_types_path
  end
end
