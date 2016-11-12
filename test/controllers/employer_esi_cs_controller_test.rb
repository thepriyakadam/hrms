require 'test_helper'

class EmployerEsiCsControllerTest < ActionController::TestCase
  setup do
    @employer_esic = employer_esics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employer_esics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employer_esic" do
    assert_difference('EmployerEsic.count') do
      post :create, employer_esic: { base_component: @employer_esic.base_component, effective_from: @employer_esic.effective_from, effective_to: @employer_esic.effective_to, is_active: @employer_esic.is_active, is_confirm: @employer_esic.is_confirm, percentage: @employer_esic.percentage }
    end

    assert_redirected_to employer_esic_path(assigns(:employer_esic))
  end

  test "should show employer_esic" do
    get :show, id: @employer_esic
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employer_esic
    assert_response :success
  end

  test "should update employer_esic" do
    patch :update, id: @employer_esic, employer_esic: { base_component: @employer_esic.base_component, effective_from: @employer_esic.effective_from, effective_to: @employer_esic.effective_to, is_active: @employer_esic.is_active, is_confirm: @employer_esic.is_confirm, percentage: @employer_esic.percentage }
    assert_redirected_to employer_esic_path(assigns(:employer_esic))
  end

  test "should destroy employer_esic" do
    assert_difference('EmployerEsic.count', -1) do
      delete :destroy, id: @employer_esic
    end

    assert_redirected_to employer_esics_path
  end
end
