require 'test_helper'

class RatingMastersControllerTest < ActionController::TestCase
  setup do
    @rating_master = rating_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rating_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rating_master" do
    assert_difference('RatingMaster.count') do
      post :create, rating_master: { code: @rating_master.code, description: @rating_master.description }
    end

    assert_redirected_to rating_master_path(assigns(:rating_master))
  end

  test "should show rating_master" do
    get :show, id: @rating_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rating_master
    assert_response :success
  end

  test "should update rating_master" do
    patch :update, id: @rating_master, rating_master: { code: @rating_master.code, description: @rating_master.description }
    assert_redirected_to rating_master_path(assigns(:rating_master))
  end

  test "should destroy rating_master" do
    assert_difference('RatingMaster.count', -1) do
      delete :destroy, id: @rating_master
    end

    assert_redirected_to rating_masters_path
  end
end
