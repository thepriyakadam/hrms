require 'test_helper'

class QuestionMastersControllerTest < ActionController::TestCase
  setup do
    @question_master = question_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:question_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create question_master" do
    assert_difference('QuestionMaster.count') do
      post :create, question_master: { code: @question_master.code, description: @question_master.description, name: @question_master.name }
    end

    assert_redirected_to question_master_path(assigns(:question_master))
  end

  test "should show question_master" do
    get :show, id: @question_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @question_master
    assert_response :success
  end

  test "should update question_master" do
    patch :update, id: @question_master, question_master: { code: @question_master.code, description: @question_master.description, name: @question_master.name }
    assert_redirected_to question_master_path(assigns(:question_master))
  end

  test "should destroy question_master" do
    assert_difference('QuestionMaster.count', -1) do
      delete :destroy, id: @question_master
    end

    assert_redirected_to question_masters_path
  end
end
