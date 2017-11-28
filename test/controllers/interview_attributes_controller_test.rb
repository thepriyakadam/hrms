require 'test_helper'

class InterviewAttributesControllerTest < ActionController::TestCase
  setup do
    @interview_attribute = interview_attributes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:interview_attributes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create interview_attribute" do
    assert_difference('InterviewAttribute.count') do
      post :create, interview_attribute: { code: @interview_attribute.code, description: @interview_attribute.description, name: @interview_attribute.name }
    end

    assert_redirected_to interview_attribute_path(assigns(:interview_attribute))
  end

  test "should show interview_attribute" do
    get :show, id: @interview_attribute
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @interview_attribute
    assert_response :success
  end

  test "should update interview_attribute" do
    patch :update, id: @interview_attribute, interview_attribute: { code: @interview_attribute.code, description: @interview_attribute.description, name: @interview_attribute.name }
    assert_redirected_to interview_attribute_path(assigns(:interview_attribute))
  end

  test "should destroy interview_attribute" do
    assert_difference('InterviewAttribute.count', -1) do
      delete :destroy, id: @interview_attribute
    end

    assert_redirected_to interview_attributes_path
  end
end
