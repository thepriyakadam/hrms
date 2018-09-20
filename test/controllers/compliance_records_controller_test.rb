require 'test_helper'

class ComplianceRecordsControllerTest < ActionController::TestCase
  setup do
    @compliance_record = compliance_records(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:compliance_records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create compliance_record" do
    assert_difference('ComplianceRecord.count') do
      post :create, compliance_record: { agency_id: @compliance_record.agency_id, amount: @compliance_record.amount, comment: @compliance_record.comment, compliance_date: @compliance_record.compliance_date, compliance_type_id: @compliance_record.compliance_type_id, status: @compliance_record.status }
    end

    assert_redirected_to compliance_record_path(assigns(:compliance_record))
  end

  test "should show compliance_record" do
    get :show, id: @compliance_record
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @compliance_record
    assert_response :success
  end

  test "should update compliance_record" do
    patch :update, id: @compliance_record, compliance_record: { agency_id: @compliance_record.agency_id, amount: @compliance_record.amount, comment: @compliance_record.comment, compliance_date: @compliance_record.compliance_date, compliance_type_id: @compliance_record.compliance_type_id, status: @compliance_record.status }
    assert_redirected_to compliance_record_path(assigns(:compliance_record))
  end

  test "should destroy compliance_record" do
    assert_difference('ComplianceRecord.count', -1) do
      delete :destroy, id: @compliance_record
    end

    assert_redirected_to compliance_records_path
  end
end
