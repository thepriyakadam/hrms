require 'test_helper'

class RewardRecognitionsControllerTest < ActionController::TestCase
  setup do
    @reward_recognition = reward_recognitions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reward_recognitions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reward_recognition" do
    assert_difference('RewardRecognition.count') do
      post :create, reward_recognition: { communication: @reward_recognition.communication, cost_unit: @reward_recognition.cost_unit, reward_owner_id: @reward_recognition.reward_owner_id, reward_type_id: @reward_recognition.reward_type_id, type: @reward_recognition.type }
    end

    assert_redirected_to reward_recognition_path(assigns(:reward_recognition))
  end

  test "should show reward_recognition" do
    get :show, id: @reward_recognition
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reward_recognition
    assert_response :success
  end

  test "should update reward_recognition" do
    patch :update, id: @reward_recognition, reward_recognition: { communication: @reward_recognition.communication, cost_unit: @reward_recognition.cost_unit, reward_owner_id: @reward_recognition.reward_owner_id, reward_type_id: @reward_recognition.reward_type_id, type: @reward_recognition.type }
    assert_redirected_to reward_recognition_path(assigns(:reward_recognition))
  end

  test "should destroy reward_recognition" do
    assert_difference('RewardRecognition.count', -1) do
      delete :destroy, id: @reward_recognition
    end

    assert_redirected_to reward_recognitions_path
  end
end
