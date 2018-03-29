require 'test_helper'

class PfEmployersControllerTest < ActionController::TestCase
  setup do
    @pf_employer = pf_employers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pf_employers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pf_employer" do
    assert_difference('PfEmployer.count') do
      post :create, pf_employer: { base_component: @pf_employer.base_component, effective_from: @pf_employer.effective_from, effective_to: @pf_employer.effective_to, is_active: @pf_employer.is_active, is_confirm: @pf_employer.is_confirm, percentage: @pf_employer.percentage }
    end

    assert_redirected_to pf_employer_path(assigns(:pf_employer))
  end

  test "should show pf_employer" do
    get :show, id: @pf_employer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pf_employer
    assert_response :success
  end

  test "should update pf_employer" do
    patch :update, id: @pf_employer, pf_employer: { base_component: @pf_employer.base_component, effective_from: @pf_employer.effective_from, effective_to: @pf_employer.effective_to, is_active: @pf_employer.is_active, is_confirm: @pf_employer.is_confirm, percentage: @pf_employer.percentage }
    assert_redirected_to pf_employer_path(assigns(:pf_employer))
  end

  test "should destroy pf_employer" do
    assert_difference('PfEmployer.count', -1) do
      delete :destroy, id: @pf_employer
    end

    assert_redirected_to pf_employers_path
  end
end
