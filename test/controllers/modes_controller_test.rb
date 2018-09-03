require 'test_helper'

class ModesControllerTest < ActionController::TestCase
  setup do
    @mode = modes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:modes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mode" do
    assert_difference('Mode.count') do
      post :create, mode: { code: @mode.code, description: @mode.description, expence_opestion_id: @mode.expence_opestion_id, name: @mode.name, status: @mode.status }
    end

    assert_redirected_to mode_path(assigns(:mode))
  end

  test "should show mode" do
    get :show, id: @mode
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mode
    assert_response :success
  end

  test "should update mode" do
    patch :update, id: @mode, mode: { code: @mode.code, description: @mode.description, expence_opestion_id: @mode.expence_opestion_id, name: @mode.name, status: @mode.status }
    assert_redirected_to mode_path(assigns(:mode))
  end

  test "should destroy mode" do
    assert_difference('Mode.count', -1) do
      delete :destroy, id: @mode
    end

    assert_redirected_to modes_path
  end
end
