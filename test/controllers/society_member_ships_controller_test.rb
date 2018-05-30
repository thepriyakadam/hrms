require 'test_helper'

class SocietyMemberShipsControllerTest < ActionController::TestCase
  setup do
    @society_member_ship = society_member_ships(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:society_member_ships)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create society_member_ship' do
    assert_difference('SocietyMemberShip.count') do
      post :create, society_member_ship: { amount: @society_member_ship.amount, employee_id: @society_member_ship.employee_id, is_society_member: @society_member_ship.is_society_member }
    end

    assert_redirected_to society_member_ship_path(assigns(:society_member_ship))
  end

  test 'should show society_member_ship' do
    get :show, id: @society_member_ship
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @society_member_ship
    assert_response :success
  end

  test 'should update society_member_ship' do
    patch :update, id: @society_member_ship, society_member_ship: { amount: @society_member_ship.amount, employee_id: @society_member_ship.employee_id, is_society_member: @society_member_ship.is_society_member }
    assert_redirected_to society_member_ship_path(assigns(:society_member_ship))
  end

  test 'should destroy society_member_ship' do
    assert_difference('SocietyMemberShip.count', -1) do
      delete :destroy, id: @society_member_ship
    end

    assert_redirected_to society_member_ships_path
  end
end
