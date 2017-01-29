require 'test_helper'

class InductionTemplatesControllerTest < ActionController::TestCase
  setup do
    @induction_template = induction_templates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:induction_templates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create induction_template" do
    assert_difference('InductionTemplate.count') do
      post :create, induction_template: { activity: @induction_template.activity, day: @induction_template.day, description: @induction_template.description, duration: @induction_template.duration, employee_id: @induction_template.employee_id, template_no: @induction_template.template_no }
    end

    assert_redirected_to induction_template_path(assigns(:induction_template))
  end

  test "should show induction_template" do
    get :show, id: @induction_template
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @induction_template
    assert_response :success
  end

  test "should update induction_template" do
    patch :update, id: @induction_template, induction_template: { activity: @induction_template.activity, day: @induction_template.day, description: @induction_template.description, duration: @induction_template.duration, employee_id: @induction_template.employee_id, template_no: @induction_template.template_no }
    assert_redirected_to induction_template_path(assigns(:induction_template))
  end

  test "should destroy induction_template" do
    assert_difference('InductionTemplate.count', -1) do
      delete :destroy, id: @induction_template
    end

    assert_redirected_to induction_templates_path
  end
end
