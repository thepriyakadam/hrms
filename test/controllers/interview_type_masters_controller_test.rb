require 'test_helper'

class InterviewTypeMastersControllerTest < ActionController::TestCase
  setup do
    @interview_type_master = interview_type_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:interview_type_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create interview_type_master" do
    assert_difference('InterviewTypeMaster.count') do
      post :create, interview_type_master: { code: @interview_type_master.code, description: @interview_type_master.description, name: @interview_type_master.name }
    end

    assert_redirected_to interview_type_master_path(assigns(:interview_type_master))
  end

  test "should show interview_type_master" do
    get :show, id: @interview_type_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @interview_type_master
    assert_response :success
  end

  test "should update interview_type_master" do
    patch :update, id: @interview_type_master, interview_type_master: { code: @interview_type_master.code, description: @interview_type_master.description, name: @interview_type_master.name }
    assert_redirected_to interview_type_master_path(assigns(:interview_type_master))
  end

  test "should destroy interview_type_master" do
    assert_difference('InterviewTypeMaster.count', -1) do
      delete :destroy, id: @interview_type_master
    end

    assert_redirected_to interview_type_masters_path
  end
end
