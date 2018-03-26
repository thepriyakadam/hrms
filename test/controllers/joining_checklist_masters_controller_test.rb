require 'test_helper'

class JoiningChecklistMastersControllerTest < ActionController::TestCase
  setup do
    @joining_checklist_master = joining_checklist_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:joining_checklist_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create joining_checklist_master" do
    assert_difference('JoiningChecklistMaster.count') do
      post :create, joining_checklist_master: { code: @joining_checklist_master.code, description: @joining_checklist_master.description, name: @joining_checklist_master.name, status: @joining_checklist_master.status }
    end

    assert_redirected_to joining_checklist_master_path(assigns(:joining_checklist_master))
  end

  test "should show joining_checklist_master" do
    get :show, id: @joining_checklist_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @joining_checklist_master
    assert_response :success
  end

  test "should update joining_checklist_master" do
    patch :update, id: @joining_checklist_master, joining_checklist_master: { code: @joining_checklist_master.code, description: @joining_checklist_master.description, name: @joining_checklist_master.name, status: @joining_checklist_master.status }
    assert_redirected_to joining_checklist_master_path(assigns(:joining_checklist_master))
  end

  test "should destroy joining_checklist_master" do
    assert_difference('JoiningChecklistMaster.count', -1) do
      delete :destroy, id: @joining_checklist_master
    end

    assert_redirected_to joining_checklist_masters_path
  end
end
