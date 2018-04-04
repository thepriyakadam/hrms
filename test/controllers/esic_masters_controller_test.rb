require 'test_helper'

class EsicMastersControllerTest < ActionController::TestCase
  setup do
    @esic_master = esic_masters(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:esic_masters)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create esic_master' do
    assert_difference('EsicMaster.count') do
      post :create, esic_master: { base_component: @esic_master.base_component, date_effective: @esic_master.date_effective, esic: @esic_master.esic, max_limit: @esic_master.max_limit, percentage: @esic_master.percentage }
    end

    assert_redirected_to esic_master_path(assigns(:esic_master))
  end

  test 'should show esic_master' do
    get :show, id: @esic_master
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @esic_master
    assert_response :success
  end

  test 'should update esic_master' do
    patch :update, id: @esic_master, esic_master: { base_component: @esic_master.base_component, date_effective: @esic_master.date_effective, esic: @esic_master.esic, max_limit: @esic_master.max_limit, percentage: @esic_master.percentage }
    assert_redirected_to esic_master_path(assigns(:esic_master))
  end

  test 'should destroy esic_master' do
    assert_difference('EsicMaster.count', -1) do
      delete :destroy, id: @esic_master
    end

    assert_redirected_to esic_masters_path
  end
end
