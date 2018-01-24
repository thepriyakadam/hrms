require 'test_helper'

class AnswerMastersControllerTest < ActionController::TestCase
  setup do
    @answer_master = answer_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:answer_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create answer_master" do
    assert_difference('AnswerMaster.count') do
      post :create, answer_master: { code: @answer_master.code, name: @answer_master.name, status: @answer_master.status }
    end

    assert_redirected_to answer_master_path(assigns(:answer_master))
  end

  test "should show answer_master" do
    get :show, id: @answer_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @answer_master
    assert_response :success
  end

  test "should update answer_master" do
    patch :update, id: @answer_master, answer_master: { code: @answer_master.code, name: @answer_master.name, status: @answer_master.status }
    assert_redirected_to answer_master_path(assigns(:answer_master))
  end

  test "should destroy answer_master" do
    assert_difference('AnswerMaster.count', -1) do
      delete :destroy, id: @answer_master
    end

    assert_redirected_to answer_masters_path
  end
end
