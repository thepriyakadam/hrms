require 'test_helper'

class WeekoffMastersControllerTest < ActionController::TestCase
  setup do
    @weekoff_master = weekoff_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:weekoff_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create weekoff_master" do
    assert_difference('WeekoffMaster.count') do
      post :create, weekoff_master: { day: @weekoff_master.day }
    end

    assert_redirected_to weekoff_master_path(assigns(:weekoff_master))
  end

  test "should show weekoff_master" do
    get :show, id: @weekoff_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @weekoff_master
    assert_response :success
  end

  test "should update weekoff_master" do
    patch :update, id: @weekoff_master, weekoff_master: { day: @weekoff_master.day }
    assert_redirected_to weekoff_master_path(assigns(:weekoff_master))
  end

  test "should destroy weekoff_master" do
    assert_difference('WeekoffMaster.count', -1) do
      delete :destroy, id: @weekoff_master
    end

    assert_redirected_to weekoff_masters_path
  end
end
