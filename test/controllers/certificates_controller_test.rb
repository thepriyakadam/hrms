require 'test_helper'

class CertificatesControllerTest < ActionController::TestCase
  setup do
    @certificate = certificates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:certificates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create certificate" do
    assert_difference('Certificate.count') do
      post :create, certificate: { b1_end: @certificate.b1_end, b1_start: @certificate.b1_start, b2_end: @certificate.b2_end, b2_start: @certificate.b2_start, b3_end: @certificate.b3_end, b3_start: @certificate.b3_start, b4_end: @certificate.b4_end, b4_start: @certificate.b4_start, b5_end: @certificate.b5_end, b5_start: @certificate.b5_start, certificate_master_id: @certificate.certificate_master_id, f1_end: @certificate.f1_end, f1_start: @certificate.f1_start, f2_end: @certificate.f2_end, f2_start: @certificate.f2_start, h1_end: @certificate.h1_end, h1_start: @certificate.h1_start, h2_end: @certificate.h2_end, h2_start: @certificate.h2_start }
    end

    assert_redirected_to certificate_path(assigns(:certificate))
  end

  test "should show certificate" do
    get :show, id: @certificate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @certificate
    assert_response :success
  end

  test "should update certificate" do
    patch :update, id: @certificate, certificate: { b1_end: @certificate.b1_end, b1_start: @certificate.b1_start, b2_end: @certificate.b2_end, b2_start: @certificate.b2_start, b3_end: @certificate.b3_end, b3_start: @certificate.b3_start, b4_end: @certificate.b4_end, b4_start: @certificate.b4_start, b5_end: @certificate.b5_end, b5_start: @certificate.b5_start, certificate_master_id: @certificate.certificate_master_id, f1_end: @certificate.f1_end, f1_start: @certificate.f1_start, f2_end: @certificate.f2_end, f2_start: @certificate.f2_start, h1_end: @certificate.h1_end, h1_start: @certificate.h1_start, h2_end: @certificate.h2_end, h2_start: @certificate.h2_start }
    assert_redirected_to certificate_path(assigns(:certificate))
  end

  test "should destroy certificate" do
    assert_difference('Certificate.count', -1) do
      delete :destroy, id: @certificate
    end

    assert_redirected_to certificates_path
  end
end
