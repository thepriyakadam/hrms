require 'test_helper'

class TrainingTopicMastersControllerTest < ActionController::TestCase
  setup do
    @training_topic_master = training_topic_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:training_topic_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create training_topic_master" do
    assert_difference('TrainingTopicMaster.count') do
      post :create, training_topic_master: { code: @training_topic_master.code, description: @training_topic_master.description, name: @training_topic_master.name, status: @training_topic_master.status }
    end

    assert_redirected_to training_topic_master_path(assigns(:training_topic_master))
  end

  test "should show training_topic_master" do
    get :show, id: @training_topic_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @training_topic_master
    assert_response :success
  end

  test "should update training_topic_master" do
    patch :update, id: @training_topic_master, training_topic_master: { code: @training_topic_master.code, description: @training_topic_master.description, name: @training_topic_master.name, status: @training_topic_master.status }
    assert_redirected_to training_topic_master_path(assigns(:training_topic_master))
  end

  test "should destroy training_topic_master" do
    assert_difference('TrainingTopicMaster.count', -1) do
      delete :destroy, id: @training_topic_master
    end

    assert_redirected_to training_topic_masters_path
  end
end
