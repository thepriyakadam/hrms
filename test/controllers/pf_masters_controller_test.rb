require 'test_helper'

class PfMastersControllerTest < ActionController::TestCase
  setup do
    @pf_master = pf_masters(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:pf_masters)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create pf_master' do
    assert_difference('PfMaster.count') do
      post :create, pf_master: { base_component: @pf_master.base_component, date_effective: @pf_master.date_effective, is_active: @pf_master.is_active, is_pf: @pf_master.is_pf, min_limit: @pf_master.min_limit, percentage: @pf_master.percentage }
    end

    assert_redirected_to pf_master_path(assigns(:pf_master))
  end

  test 'should show pf_master' do
    get :show, id: @pf_master
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @pf_master
    assert_response :success
  end

  test 'should update pf_master' do
    patch :update, id: @pf_master, pf_master: { base_component: @pf_master.base_component, date_effective: @pf_master.date_effective, is_active: @pf_master.is_active, is_pf: @pf_master.is_pf, min_limit: @pf_master.min_limit, percentage: @pf_master.percentage }
    assert_redirected_to pf_master_path(assigns(:pf_master))
  end

  test 'should destroy pf_master' do
    assert_difference('PfMaster.count', -1) do
      delete :destroy, id: @pf_master
    end

    assert_redirected_to pf_masters_path
  end
end
