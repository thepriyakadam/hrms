require 'test_helper'

class BonusMastersControllerTest < ActionController::TestCase
  setup do
    @bonus_master = bonus_masters(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:bonus_masters)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create bonus_master' do
    assert_difference('BonusMaster.count') do
      post :create, bonus_master: { bonus_persentage: @bonus_master.bonus_persentage, is_bouns: @bonus_master.is_bouns, limit_amount: @bonus_master.limit_amount, status: @bonus_master.status }
    end

    assert_redirected_to bonus_master_path(assigns(:bonus_master))
  end

  test 'should show bonus_master' do
    get :show, id: @bonus_master
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @bonus_master
    assert_response :success
  end

  test 'should update bonus_master' do
    patch :update, id: @bonus_master, bonus_master: { bonus_persentage: @bonus_master.bonus_persentage, is_bouns: @bonus_master.is_bouns, limit_amount: @bonus_master.limit_amount, status: @bonus_master.status }
    assert_redirected_to bonus_master_path(assigns(:bonus_master))
  end

  test 'should destroy bonus_master' do
    assert_difference('BonusMaster.count', -1) do
      delete :destroy, id: @bonus_master
    end

    assert_redirected_to bonus_masters_path
  end
end
