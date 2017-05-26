require 'test_helper'

class RecognitionTypesControllerTest < ActionController::TestCase
  setup do
    @recognition_type = recognition_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recognition_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recognition_type" do
    assert_difference('RecognitionType.count') do
      post :create, recognition_type: { code: @recognition_type.code, description: @recognition_type.description, name: @recognition_type.name, status: @recognition_type.status }
    end

    assert_redirected_to recognition_type_path(assigns(:recognition_type))
  end

  test "should show recognition_type" do
    get :show, id: @recognition_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recognition_type
    assert_response :success
  end

  test "should update recognition_type" do
    patch :update, id: @recognition_type, recognition_type: { code: @recognition_type.code, description: @recognition_type.description, name: @recognition_type.name, status: @recognition_type.status }
    assert_redirected_to recognition_type_path(assigns(:recognition_type))
  end

  test "should destroy recognition_type" do
    assert_difference('RecognitionType.count', -1) do
      delete :destroy, id: @recognition_type
    end

    assert_redirected_to recognition_types_path
  end
end
