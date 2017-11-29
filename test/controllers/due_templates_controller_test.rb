require 'test_helper'

class DueTemplatesControllerTest < ActionController::TestCase
  setup do
    @due_template = due_templates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:due_templates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create due_template" do
    assert_difference('DueTemplate.count') do
      post :create, due_template: { code: @due_template.code, name: @due_template.name, status: @due_template.status }
    end

    assert_redirected_to due_template_path(assigns(:due_template))
  end

  test "should show due_template" do
    get :show, id: @due_template
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @due_template
    assert_response :success
  end

  test "should update due_template" do
    patch :update, id: @due_template, due_template: { code: @due_template.code, name: @due_template.name, status: @due_template.status }
    assert_redirected_to due_template_path(assigns(:due_template))
  end

  test "should destroy due_template" do
    assert_difference('DueTemplate.count', -1) do
      delete :destroy, id: @due_template
    end

    assert_redirected_to due_templates_path
  end
end
