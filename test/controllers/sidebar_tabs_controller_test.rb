require 'test_helper'

class SidebarTabsControllerTest < ActionController::TestCase
  setup do
    @sidebar_tab = sidebar_tabs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sidebar_tabs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sidebar_tab" do
    assert_difference('SidebarTab.count') do
      post :create, sidebar_tab: { name: @sidebar_tab.name, status: @sidebar_tab.status }
    end

    assert_redirected_to sidebar_tab_path(assigns(:sidebar_tab))
  end

  test "should show sidebar_tab" do
    get :show, id: @sidebar_tab
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sidebar_tab
    assert_response :success
  end

  test "should update sidebar_tab" do
    patch :update, id: @sidebar_tab, sidebar_tab: { name: @sidebar_tab.name, status: @sidebar_tab.status }
    assert_redirected_to sidebar_tab_path(assigns(:sidebar_tab))
  end

  test "should destroy sidebar_tab" do
    assert_difference('SidebarTab.count', -1) do
      delete :destroy, id: @sidebar_tab
    end

    assert_redirected_to sidebar_tabs_path
  end
end
