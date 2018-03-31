require 'test_helper'

class HousingRentsControllerTest < ActionController::TestCase
  setup do
    @housing_rent = housing_rents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:housing_rents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create housing_rent" do
    assert_difference('HousingRent.count') do
      post :create, housing_rent: { accepted_rent: @housing_rent.accepted_rent, actual_rent: @housing_rent.actual_rent, address: @housing_rent.address, estimated_rent: @housing_rent.estimated_rent, investment_declaration_id: @housing_rent.investment_declaration_id, landlord_name: @housing_rent.landlord_name, landlord_pan_no: @housing_rent.landlord_pan_no, metro_city: @housing_rent.metro_city, rejected_rent: @housing_rent.rejected_rent }
    end

    assert_redirected_to housing_rent_path(assigns(:housing_rent))
  end

  test "should show housing_rent" do
    get :show, id: @housing_rent
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @housing_rent
    assert_response :success
  end

  test "should update housing_rent" do
    patch :update, id: @housing_rent, housing_rent: { accepted_rent: @housing_rent.accepted_rent, actual_rent: @housing_rent.actual_rent, address: @housing_rent.address, estimated_rent: @housing_rent.estimated_rent, investment_declaration_id: @housing_rent.investment_declaration_id, landlord_name: @housing_rent.landlord_name, landlord_pan_no: @housing_rent.landlord_pan_no, metro_city: @housing_rent.metro_city, rejected_rent: @housing_rent.rejected_rent }
    assert_redirected_to housing_rent_path(assigns(:housing_rent))
  end

  test "should destroy housing_rent" do
    assert_difference('HousingRent.count', -1) do
      delete :destroy, id: @housing_rent
    end

    assert_redirected_to housing_rents_path
  end
end
