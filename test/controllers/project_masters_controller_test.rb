require 'test_helper'

class ProjectMastersControllerTest < ActionController::TestCase
  setup do
    @project_master = project_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_master" do
    assert_difference('ProjectMaster.count') do
      post :create, project_master: { code: @project_master.code, description: @project_master.description, name: @project_master.name }
    end

    assert_redirected_to project_master_path(assigns(:project_master))
  end

  test "should show project_master" do
    get :show, id: @project_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project_master
    assert_response :success
  end

  test "should update project_master" do
    patch :update, id: @project_master, project_master: { code: @project_master.code, description: @project_master.description, name: @project_master.name }
    assert_redirected_to project_master_path(assigns(:project_master))
  end

  test "should destroy project_master" do
    assert_difference('ProjectMaster.count', -1) do
      delete :destroy, id: @project_master
    end

    assert_redirected_to project_masters_path
  end
end
