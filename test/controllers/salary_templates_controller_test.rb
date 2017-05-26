require 'test_helper'

class SalaryTemplatesControllerTest < ActionController::TestCase
  setup do
    @salary_template = salary_templates(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:salary_templates)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create salary_template' do
    assert_difference('SalaryTemplate.count') do
      post :create, salary_template: { code: @salary_template.code, description: @salary_template.description, validity_date: @salary_template.validity_date }
    end

    assert_redirected_to salary_template_path(assigns(:salary_template))
  end

  test 'should show salary_template' do
    get :show, id: @salary_template
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @salary_template
    assert_response :success
  end

  test 'should update salary_template' do
    patch :update, id: @salary_template, salary_template: { code: @salary_template.code, description: @salary_template.description, validity_date: @salary_template.validity_date }
    assert_redirected_to salary_template_path(assigns(:salary_template))
  end

  test 'should destroy salary_template' do
    assert_difference('SalaryTemplate.count', -1) do
      delete :destroy, id: @salary_template
    end

    assert_redirected_to salary_templates_path
  end
end
