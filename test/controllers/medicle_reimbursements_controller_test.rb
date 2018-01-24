require 'test_helper'

class MedicleReimbursementsControllerTest < ActionController::TestCase
  setup do
    @medicle_reimbursement = medicle_reimbursements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medicle_reimbursements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medicle_reimbursement" do
    assert_difference('MedicleReimbursement.count') do
      post :create, medicle_reimbursement: { actual_amt: @medicle_reimbursement.actual_amt, bill_date: @medicle_reimbursement.bill_date, bill_no: @medicle_reimbursement.bill_no, estimated_amt: @medicle_reimbursement.estimated_amt, investment_declaration_id: @medicle_reimbursement.investment_declaration_id, name_on_invoice: @medicle_reimbursement.name_on_invoice, toatal_amt: @medicle_reimbursement.toatal_amt }
    end

    assert_redirected_to medicle_reimbursement_path(assigns(:medicle_reimbursement))
  end

  test "should show medicle_reimbursement" do
    get :show, id: @medicle_reimbursement
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medicle_reimbursement
    assert_response :success
  end

  test "should update medicle_reimbursement" do
    patch :update, id: @medicle_reimbursement, medicle_reimbursement: { actual_amt: @medicle_reimbursement.actual_amt, bill_date: @medicle_reimbursement.bill_date, bill_no: @medicle_reimbursement.bill_no, estimated_amt: @medicle_reimbursement.estimated_amt, investment_declaration_id: @medicle_reimbursement.investment_declaration_id, name_on_invoice: @medicle_reimbursement.name_on_invoice, toatal_amt: @medicle_reimbursement.toatal_amt }
    assert_redirected_to medicle_reimbursement_path(assigns(:medicle_reimbursement))
  end

  test "should destroy medicle_reimbursement" do
    assert_difference('MedicleReimbursement.count', -1) do
      delete :destroy, id: @medicle_reimbursement
    end

    assert_redirected_to medicle_reimbursements_path
  end
end
