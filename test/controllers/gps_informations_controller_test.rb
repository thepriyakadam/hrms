require 'test_helper'

class GpsInformationsControllerTest < ActionController::TestCase
  setup do
    @gps_information = gps_informations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gps_informations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gps_information" do
    assert_difference('GpsInformation.count') do
      post :create, gps_information: { day: @gps_information.day, employee_id: @gps_information.employee_id, latitude: @gps_information.latitude, longitude: @gps_information.longitude, place: @gps_information.place, radius: @gps_information.radius }
    end

    assert_redirected_to gps_information_path(assigns(:gps_information))
  end

  test "should show gps_information" do
    get :show, id: @gps_information
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gps_information
    assert_response :success
  end

  test "should update gps_information" do
    patch :update, id: @gps_information, gps_information: { day: @gps_information.day, employee_id: @gps_information.employee_id, latitude: @gps_information.latitude, longitude: @gps_information.longitude, place: @gps_information.place, radius: @gps_information.radius }
    assert_redirected_to gps_information_path(assigns(:gps_information))
  end

  test "should destroy gps_information" do
    assert_difference('GpsInformation.count', -1) do
      delete :destroy, id: @gps_information
    end

    assert_redirected_to gps_informations_path
  end
end
