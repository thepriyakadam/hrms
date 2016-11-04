require 'test_helper'

class EsicEmployerMastersControllerTest < ActionController::TestCase
  setup do
    @esic_employer_master = esic_employer_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:esic_employer_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create esic_employer_master" do
    assert_difference('EsicEmployerMaster.count') do
      post :create, esic_employer_master: { base_component: @esic_employer_master.base_component, effective_from: @esic_employer_master.effective_from, effective_to: @esic_employer_master.effective_to, esic: @esic_employer_master.esic, is_active: @esic_employer_master.is_active, is_confirm: @esic_employer_master.is_confirm, max_limit: @esic_employer_master.max_limit, percentage: @esic_employer_master.percentage }
    end

    assert_redirected_to esic_employer_master_path(assigns(:esic_employer_master))
  end

  test "should show esic_employer_master" do
    get :show, id: @esic_employer_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @esic_employer_master
    assert_response :success
  end

  test "should update esic_employer_master" do
    patch :update, id: @esic_employer_master, esic_employer_master: { base_component: @esic_employer_master.base_component, effective_from: @esic_employer_master.effective_from, effective_to: @esic_employer_master.effective_to, esic: @esic_employer_master.esic, is_active: @esic_employer_master.is_active, is_confirm: @esic_employer_master.is_confirm, max_limit: @esic_employer_master.max_limit, percentage: @esic_employer_master.percentage }
    assert_redirected_to esic_employer_master_path(assigns(:esic_employer_master))
  end

  test "should destroy esic_employer_master" do
    assert_difference('EsicEmployerMaster.count', -1) do
      delete :destroy, id: @esic_employer_master
    end

    assert_redirected_to esic_employer_masters_path
  end
end
