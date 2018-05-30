require 'test_helper'

class InductionMastersControllerTest < ActionController::TestCase
  setup do
    @induction_master = induction_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:induction_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create induction_master" do
    assert_difference('InductionMaster.count') do
      post :create, induction_master: { code: @induction_master.code, description: @induction_master.description }
    end

    assert_redirected_to induction_master_path(assigns(:induction_master))
  end

  test "should show induction_master" do
    get :show, id: @induction_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @induction_master
    assert_response :success
  end

  test "should update induction_master" do
    patch :update, id: @induction_master, induction_master: { code: @induction_master.code, description: @induction_master.description }
    assert_redirected_to induction_master_path(assigns(:induction_master))
  end

  test "should destroy induction_master" do
    assert_difference('InductionMaster.count', -1) do
      delete :destroy, id: @induction_master
    end

    assert_redirected_to induction_masters_path
  end
end
