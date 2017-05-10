require 'test_helper'

class SalaryComponentsControllerTest < ActionController::TestCase
  setup do
    @salary_component = salary_components(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:salary_components)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create salary_component' do
    assert_difference('SalaryComponent.count') do
      post :create, salary_component: { code: @salary_component.code, description: @salary_component.description, is_deducted: @salary_component.is_deducted, name: @salary_component.name }
    end

    assert_redirected_to salary_component_path(assigns(:salary_component))
  end

  test 'should show salary_component' do
    get :show, id: @salary_component
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @salary_component
    assert_response :success
  end

  test 'should update salary_component' do
    patch :update, id: @salary_component, salary_component: { code: @salary_component.code, description: @salary_component.description, is_deducted: @salary_component.is_deducted, name: @salary_component.name }
    assert_redirected_to salary_component_path(assigns(:salary_component))
  end

  test 'should destroy salary_component' do
    assert_difference('SalaryComponent.count', -1) do
      delete :destroy, id: @salary_component
    end

    assert_redirected_to salary_components_path
  end
end
