require 'test_helper'

class ShiftRotationsControllerTest < ActionController::TestCase
  setup do
    @shift_rotation = shift_rotations(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:shift_rotations)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create shift_rotation' do
    assert_difference('ShiftRotation.count') do
      post :create, shift_rotation: { company_shift_id: @shift_rotation.company_shift_id, end_date: @shift_rotation.end_date, start_date: @shift_rotation.start_date }
    end

    assert_redirected_to shift_rotation_path(assigns(:shift_rotation))
  end

  test 'should show shift_rotation' do
    get :show, id: @shift_rotation
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @shift_rotation
    assert_response :success
  end

  test 'should update shift_rotation' do
    patch :update, id: @shift_rotation, shift_rotation: { company_shift_id: @shift_rotation.company_shift_id, end_date: @shift_rotation.end_date, start_date: @shift_rotation.start_date }
    assert_redirected_to shift_rotation_path(assigns(:shift_rotation))
  end

  test 'should destroy shift_rotation' do
    assert_difference('ShiftRotation.count', -1) do
      delete :destroy, id: @shift_rotation
    end

    assert_redirected_to shift_rotations_path
  end
end
