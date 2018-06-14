require 'test_helper'

class TransactionRecordsControllerTest < ActionController::TestCase
  setup do
    @transaction_record = transaction_records(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transaction_records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transaction_record" do
    assert_difference('TransactionRecord.count') do
      post :create, transaction_record: { after_days: @transaction_record.after_days, compliance_type_id: @transaction_record.compliance_type_id, email_1: @transaction_record.email_1, email_2: @transaction_record.email_2, email_3: @transaction_record.email_3, is_confirm: @transaction_record.is_confirm, previous_days: @transaction_record.previous_days, reminder_Date: @transaction_record.reminder_Date, status: @transaction_record.status, submission_date: @transaction_record.submission_date, type: @transaction_record.type }
    end

    assert_redirected_to transaction_record_path(assigns(:transaction_record))
  end

  test "should show transaction_record" do
    get :show, id: @transaction_record
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @transaction_record
    assert_response :success
  end

  test "should update transaction_record" do
    patch :update, id: @transaction_record, transaction_record: { after_days: @transaction_record.after_days, compliance_type_id: @transaction_record.compliance_type_id, email_1: @transaction_record.email_1, email_2: @transaction_record.email_2, email_3: @transaction_record.email_3, is_confirm: @transaction_record.is_confirm, previous_days: @transaction_record.previous_days, reminder_Date: @transaction_record.reminder_Date, status: @transaction_record.status, submission_date: @transaction_record.submission_date, type: @transaction_record.type }
    assert_redirected_to transaction_record_path(assigns(:transaction_record))
  end

  test "should destroy transaction_record" do
    assert_difference('TransactionRecord.count', -1) do
      delete :destroy, id: @transaction_record
    end

    assert_redirected_to transaction_records_path
  end
end
