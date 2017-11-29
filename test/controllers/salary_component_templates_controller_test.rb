require 'test_helper'

class SalaryComponentTemplatesControllerTest < ActionController::TestCase
  setup do
    @salary_component_template = salary_component_templates(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:salary_component_templates)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create salary_component_template' do
    assert_difference('SalaryComponentTemplate.count') do
      post :create, salary_component_template: { annual_amount: @salary_component_template.annual_amount, auto_template_code: @salary_component_template.auto_template_code, base: @salary_component_template.base, is_deducted: @salary_component_template.is_deducted, is_taxable: @salary_component_template.is_taxable, manual_template_code: @salary_component_template.manual_template_code, max_amount: @salary_component_template.max_amount, monthly_amount: @salary_component_template.monthly_amount, parent_salary_component_id: @salary_component_template.parent_salary_component_id, percentage: @salary_component_template.percentage, salary_component_id: @salary_component_template.salary_component_id, salary_template: @salary_component_template.salary_template, tax: @salary_component_template.tax, to_be_paid: @salary_component_template.to_be_paid }
    end

    assert_redirected_to salary_component_template_path(assigns(:salary_component_template))
  end

  test 'should show salary_component_template' do
    get :show, id: @salary_component_template
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @salary_component_template
    assert_response :success
  end

  test 'should update salary_component_template' do
    patch :update, id: @salary_component_template, salary_component_template: { annual_amount: @salary_component_template.annual_amount, auto_template_code: @salary_component_template.auto_template_code, base: @salary_component_template.base, is_deducted: @salary_component_template.is_deducted, is_taxable: @salary_component_template.is_taxable, manual_template_code: @salary_component_template.manual_template_code, max_amount: @salary_component_template.max_amount, monthly_amount: @salary_component_template.monthly_amount, parent_salary_component_id: @salary_component_template.parent_salary_component_id, percentage: @salary_component_template.percentage, salary_component_id: @salary_component_template.salary_component_id, salary_template: @salary_component_template.salary_template, tax: @salary_component_template.tax, to_be_paid: @salary_component_template.to_be_paid }
    assert_redirected_to salary_component_template_path(assigns(:salary_component_template))
  end

  test 'should destroy salary_component_template' do
    assert_difference('SalaryComponentTemplate.count', -1) do
      delete :destroy, id: @salary_component_template
    end

    assert_redirected_to salary_component_templates_path
  end
end
