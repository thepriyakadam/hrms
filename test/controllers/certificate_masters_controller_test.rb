require 'test_helper'

class CertificateMastersControllerTest < ActionController::TestCase
  setup do
    @certificate_master = certificate_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:certificate_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create certificate_master" do
    assert_difference('CertificateMaster.count') do
      post :create, certificate_master: { confirm: @certificate_master.confirm, description: @certificate_master.description, name: @certificate_master.name, status: @certificate_master.status }
    end

    assert_redirected_to certificate_master_path(assigns(:certificate_master))
  end

  test "should show certificate_master" do
    get :show, id: @certificate_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @certificate_master
    assert_response :success
  end

  test "should update certificate_master" do
    patch :update, id: @certificate_master, certificate_master: { confirm: @certificate_master.confirm, description: @certificate_master.description, name: @certificate_master.name, status: @certificate_master.status }
    assert_redirected_to certificate_master_path(assigns(:certificate_master))
  end

  test "should destroy certificate_master" do
    assert_difference('CertificateMaster.count', -1) do
      delete :destroy, id: @certificate_master
    end

    assert_redirected_to certificate_masters_path
  end
end
