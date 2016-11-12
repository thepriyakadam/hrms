require 'test_helper'

class EmployerPFsControllerTest < ActionController::TestCase
  setup do
    @employer_pf = employer_pfs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employer_pfs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employer_pf" do
    assert_difference('EmployerPf.count') do
      post :create, employer_pf: { base_component: @employer_pf.base_component, effective_from: @employer_pf.effective_from, effective_to: @employer_pf.effective_to, is_active: @employer_pf.is_active, is_confirm: @employer_pf.is_confirm, percentage: @employer_pf.percentage }
    end

    assert_redirected_to employer_pf_path(assigns(:employer_pf))
  end

  test "should show employer_pf" do
    get :show, id: @employer_pf
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employer_pf
    assert_response :success
  end

  test "should update employer_pf" do
    patch :update, id: @employer_pf, employer_pf: { base_component: @employer_pf.base_component, effective_from: @employer_pf.effective_from, effective_to: @employer_pf.effective_to, is_active: @employer_pf.is_active, is_confirm: @employer_pf.is_confirm, percentage: @employer_pf.percentage }
    assert_redirected_to employer_pf_path(assigns(:employer_pf))
  end

  test "should destroy employer_pf" do
    assert_difference('EmployerPf.count', -1) do
      delete :destroy, id: @employer_pf
    end

    assert_redirected_to employer_pfs_path
  end
end
