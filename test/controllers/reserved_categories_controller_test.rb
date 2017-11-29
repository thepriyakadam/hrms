require 'test_helper'

class ReservedCategoriesControllerTest < ActionController::TestCase
  setup do
    @reserved_category = reserved_categories(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:reserved_categories)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create reserved_category' do
    assert_difference('ReservedCategory.count') do
      post :create, reserved_category: { code: @reserved_category.code, description: @reserved_category.description, name: @reserved_category.name }
    end

    assert_redirected_to reserved_category_path(assigns(:reserved_category))
  end

  test 'should show reserved_category' do
    get :show, id: @reserved_category
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @reserved_category
    assert_response :success
  end

  test 'should update reserved_category' do
    patch :update, id: @reserved_category, reserved_category: { code: @reserved_category.code, description: @reserved_category.description, name: @reserved_category.name }
    assert_redirected_to reserved_category_path(assigns(:reserved_category))
  end

  test 'should destroy reserved_category' do
    assert_difference('ReservedCategory.count', -1) do
      delete :destroy, id: @reserved_category
    end

    assert_redirected_to reserved_categories_path
  end
end
