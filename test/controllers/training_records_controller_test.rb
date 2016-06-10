require 'test_helper'

class TrainingRecordsControllerTest < ActionController::TestCase
  setup do
    @training_record = training_records(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:training_records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create training_record" do
    assert_difference('TrainingRecord.count') do
      post :create, training_record: { duration: @training_record.duration, employee_id: @training_record.employee_id, location: @training_record.location, trainer_name: @training_record.trainer_name, training_date: @training_record.training_date, training_topic_master_id: @training_record.training_topic_master_id }
    end

    assert_redirected_to training_record_path(assigns(:training_record))
  end

  test "should show training_record" do
    get :show, id: @training_record
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @training_record
    assert_response :success
  end

  test "should update training_record" do
    patch :update, id: @training_record, training_record: { duration: @training_record.duration, employee_id: @training_record.employee_id, location: @training_record.location, trainer_name: @training_record.trainer_name, training_date: @training_record.training_date, training_topic_master_id: @training_record.training_topic_master_id }
    assert_redirected_to training_record_path(assigns(:training_record))
  end

  test "should destroy training_record" do
    assert_difference('TrainingRecord.count', -1) do
      delete :destroy, id: @training_record
    end

    assert_redirected_to training_records_path
  end
end
