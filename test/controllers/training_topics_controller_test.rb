require 'test_helper'

class TrainingTopicsControllerTest < ActionController::TestCase
  setup do
    @training_topic = training_topics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:training_topics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create training_topic" do
    assert_difference('TrainingTopic.count') do
      post :create, training_topic: { code: @training_topic.code, description: @training_topic.description, name: @training_topic.name, status: @training_topic.status }
    end

    assert_redirected_to training_topic_path(assigns(:training_topic))
  end

  test "should show training_topic" do
    get :show, id: @training_topic
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @training_topic
    assert_response :success
  end

  test "should update training_topic" do
    patch :update, id: @training_topic, training_topic: { code: @training_topic.code, description: @training_topic.description, name: @training_topic.name, status: @training_topic.status }
    assert_redirected_to training_topic_path(assigns(:training_topic))
  end

  test "should destroy training_topic" do
    assert_difference('TrainingTopic.count', -1) do
      delete :destroy, id: @training_topic
    end

    assert_redirected_to training_topics_path
  end
end
