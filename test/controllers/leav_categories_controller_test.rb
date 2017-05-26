require 'test_helper'

class LeavCategoriesControllerTest < ActionController::TestCase
  setup do
    @leav_category = leav_categories(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:leav_categories)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create leav_category' do
    assert_difference('LeavCategory.count') do
      post :create, leav_category: { name: @leav_category.name }
    end

    assert_redirected_to leav_category_path(assigns(:leav_category))
  end

  test 'should show leav_category' do
    get :show, id: @leav_category
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @leav_category
    assert_response :success
  end

  test 'should update leav_category' do
    patch :update, id: @leav_category, leav_category: { name: @leav_category.name }
    assert_redirected_to leav_category_path(assigns(:leav_category))
  end

  test 'should destroy leav_category' do
    assert_difference('LeavCategory.count', -1) do
      delete :destroy, id: @leav_category
    end

    assert_redirected_to leav_categories_path
  end
end
