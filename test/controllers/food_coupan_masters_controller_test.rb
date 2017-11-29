require 'test_helper'

class FoodCoupanMastersControllerTest < ActionController::TestCase
  setup do
    @food_coupan_master = food_coupan_masters(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:food_coupan_masters)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create food_coupan_master' do
    assert_difference('FoodCoupanMaster.count') do
      post :create, food_coupan_master: { code: @food_coupan_master.code, description: @food_coupan_master.description, name: @food_coupan_master.name, price: @food_coupan_master.price }
    end

    assert_redirected_to food_coupan_master_path(assigns(:food_coupan_master))
  end

  test 'should show food_coupan_master' do
    get :show, id: @food_coupan_master
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @food_coupan_master
    assert_response :success
  end

  test 'should update food_coupan_master' do
    patch :update, id: @food_coupan_master, food_coupan_master: { code: @food_coupan_master.code, description: @food_coupan_master.description, name: @food_coupan_master.name, price: @food_coupan_master.price }
    assert_redirected_to food_coupan_master_path(assigns(:food_coupan_master))
  end

  test 'should destroy food_coupan_master' do
    assert_difference('FoodCoupanMaster.count', -1) do
      delete :destroy, id: @food_coupan_master
    end

    assert_redirected_to food_coupan_masters_path
  end
end
