require 'test_helper'

class RembursmentmastersControllerTest < ActionController::TestCase
  setup do
    @rembursmentmaster = rembursmentmasters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rembursmentmasters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rembursmentmaster" do
    assert_difference('Rembursmentmaster.count') do
      post :create, rembursmentmaster: { code: @rembursmentmaster.code, description: @rembursmentmaster.description, name: @rembursmentmaster.name, status: @rembursmentmaster.status }
    end

    assert_redirected_to rembursmentmaster_path(assigns(:rembursmentmaster))
  end

  test "should show rembursmentmaster" do
    get :show, id: @rembursmentmaster
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rembursmentmaster
    assert_response :success
  end

  test "should update rembursmentmaster" do
    patch :update, id: @rembursmentmaster, rembursmentmaster: { code: @rembursmentmaster.code, description: @rembursmentmaster.description, name: @rembursmentmaster.name, status: @rembursmentmaster.status }
    assert_redirected_to rembursmentmaster_path(assigns(:rembursmentmaster))
  end

  test "should destroy rembursmentmaster" do
    assert_difference('Rembursmentmaster.count', -1) do
      delete :destroy, id: @rembursmentmaster
    end

    assert_redirected_to rembursmentmasters_path
  end
end
