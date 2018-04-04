require 'test_helper'

class CircularsControllerTest < ActionController::TestCase
  setup do
    @circular = circulars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:circulars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create circular" do
    assert_difference('Circular.count') do
      post :create, circular: { date: @circular.date, subject: @circular.subject }
    end

    assert_redirected_to circular_path(assigns(:circular))
  end

  test "should show circular" do
    get :show, id: @circular
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @circular
    assert_response :success
  end

  test "should update circular" do
    patch :update, id: @circular, circular: { date: @circular.date, subject: @circular.subject }
    assert_redirected_to circular_path(assigns(:circular))
  end

  test "should destroy circular" do
    assert_difference('Circular.count', -1) do
      delete :destroy, id: @circular
    end

    assert_redirected_to circulars_path
  end
end
