require 'test_helper'

class LatemarkMastersControllerTest < ActionController::TestCase
  setup do
    @latemark_master = latemark_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:latemark_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create latemark_master" do
    assert_difference('LatemarkMaster.count') do
      post :create, latemark_master: { allow_latemark: @latemark_master.allow_latemark, amount: @latemark_master.amount, company_time: @latemark_master.company_time }
    end

    assert_redirected_to latemark_master_path(assigns(:latemark_master))
  end

  test "should show latemark_master" do
    get :show, id: @latemark_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @latemark_master
    assert_response :success
  end

  test "should update latemark_master" do
    patch :update, id: @latemark_master, latemark_master: { allow_latemark: @latemark_master.allow_latemark, amount: @latemark_master.amount, company_time: @latemark_master.company_time }
    assert_redirected_to latemark_master_path(assigns(:latemark_master))
  end

  test "should destroy latemark_master" do
    assert_difference('LatemarkMaster.count', -1) do
      delete :destroy, id: @latemark_master
    end

    assert_redirected_to latemark_masters_path
  end
end
