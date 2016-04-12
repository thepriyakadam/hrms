require 'test_helper'

class CompanyLocationsControllerTest < ActionController::TestCase
  setup do
    @company_location = company_locations(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:company_locations)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create company_location' do
    assert_difference('CompanyLocation.count') do
      post :create, company_location: { address: @company_location.address, city: @company_location.city, company_id: @company_location.company_id, contact_no: @company_location.contact_no, district: @company_location.district, name: @company_location.name, pin_code: @company_location.pin_code }
    end

    assert_redirected_to company_location_path(assigns(:company_location))
  end

  test 'should show company_location' do
    get :show, id: @company_location
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @company_location
    assert_response :success
  end

  test 'should update company_location' do
    patch :update, id: @company_location, company_location: { address: @company_location.address, city: @company_location.city, company_id: @company_location.company_id, contact_no: @company_location.contact_no, district: @company_location.district, name: @company_location.name, pin_code: @company_location.pin_code }
    assert_redirected_to company_location_path(assigns(:company_location))
  end

  test 'should destroy company_location' do
    assert_difference('CompanyLocation.count', -1) do
      delete :destroy, id: @company_location
    end

    assert_redirected_to company_locations_path
  end
end
