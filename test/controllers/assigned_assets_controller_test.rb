require 'test_helper'

class AssignedAssetsControllerTest < ActionController::TestCase
  setup do
    @assigned_asset = assigned_assets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:assigned_assets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create assigned_asset" do
    assert_difference('AssignedAsset.count') do
      post :create, assigned_asset: { assest_status: @assigned_asset.assest_status, asset_type_id: @assigned_asset.asset_type_id, assets_detail: @assigned_asset.assets_detail, assets_id: @assigned_asset.assets_id, assets_value: @assigned_asset.assets_value, employee_id: @assigned_asset.employee_id, issue_date: @assigned_asset.issue_date, remarks: @assigned_asset.remarks, returned_on: @assigned_asset.returned_on, valid_till: @assigned_asset.valid_till }
    end

    assert_redirected_to assigned_asset_path(assigns(:assigned_asset))
  end

  test "should show assigned_asset" do
    get :show, id: @assigned_asset
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @assigned_asset
    assert_response :success
  end

  test "should update assigned_asset" do
    patch :update, id: @assigned_asset, assigned_asset: { assest_status: @assigned_asset.assest_status, asset_type_id: @assigned_asset.asset_type_id, assets_detail: @assigned_asset.assets_detail, assets_id: @assigned_asset.assets_id, assets_value: @assigned_asset.assets_value, employee_id: @assigned_asset.employee_id, issue_date: @assigned_asset.issue_date, remarks: @assigned_asset.remarks, returned_on: @assigned_asset.returned_on, valid_till: @assigned_asset.valid_till }
    assert_redirected_to assigned_asset_path(assigns(:assigned_asset))
  end

  test "should destroy assigned_asset" do
    assert_difference('AssignedAsset.count', -1) do
      delete :destroy, id: @assigned_asset
    end

    assert_redirected_to assigned_assets_path
  end
end
