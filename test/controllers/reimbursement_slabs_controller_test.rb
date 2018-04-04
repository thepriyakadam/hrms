require 'test_helper'

class ReimbursementSlabsControllerTest < ActionController::TestCase
  setup do
    @reimbursement_slab = reimbursement_slabs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reimbursement_slabs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reimbursement_slab" do
    assert_difference('ReimbursementSlab.count') do
      post :create, reimbursement_slab: { employee_designation_id: @reimbursement_slab.employee_designation_id, employee_grade_id: @reimbursement_slab.employee_grade_id, from: @reimbursement_slab.from, monthly_amount: @reimbursement_slab.monthly_amount, reimbursement_head_id: @reimbursement_slab.reimbursement_head_id, status: @reimbursement_slab.status, to: @reimbursement_slab.to, yearly_amount: @reimbursement_slab.yearly_amount }
    end

    assert_redirected_to reimbursement_slab_path(assigns(:reimbursement_slab))
  end

  test "should show reimbursement_slab" do
    get :show, id: @reimbursement_slab
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reimbursement_slab
    assert_response :success
  end

  test "should update reimbursement_slab" do
    patch :update, id: @reimbursement_slab, reimbursement_slab: { employee_designation_id: @reimbursement_slab.employee_designation_id, employee_grade_id: @reimbursement_slab.employee_grade_id, from: @reimbursement_slab.from, monthly_amount: @reimbursement_slab.monthly_amount, reimbursement_head_id: @reimbursement_slab.reimbursement_head_id, status: @reimbursement_slab.status, to: @reimbursement_slab.to, yearly_amount: @reimbursement_slab.yearly_amount }
    assert_redirected_to reimbursement_slab_path(assigns(:reimbursement_slab))
  end

  test "should destroy reimbursement_slab" do
    assert_difference('ReimbursementSlab.count', -1) do
      delete :destroy, id: @reimbursement_slab
    end

    assert_redirected_to reimbursement_slabs_path
  end
end
