require 'test_helper'

class IncomeLossHousePropertiesControllerTest < ActionController::TestCase
  setup do
    @income_loss_house_property = income_loss_house_properties(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:income_loss_house_properties)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create income_loss_house_property" do
    assert_difference('IncomeLossHouseProperty.count') do
      post :create, income_loss_house_property: { actual_total_amt: @income_loss_house_property.actual_total_amt, estimated_total_amt: @income_loss_house_property.estimated_total_amt, income: @income_loss_house_property.income, investment_declaration_id: @income_loss_house_property.investment_declaration_id, less_interest: @income_loss_house_property.less_interest, less_pre_emi_interest: @income_loss_house_property.less_pre_emi_interest, less_repairs: @income_loss_house_property.less_repairs, less_taxes: @income_loss_house_property.less_taxes, property_type: @income_loss_house_property.property_type, rental_income: @income_loss_house_property.rental_income, total: @income_loss_house_property.total }
    end

    assert_redirected_to income_loss_house_property_path(assigns(:income_loss_house_property))
  end

  test "should show income_loss_house_property" do
    get :show, id: @income_loss_house_property
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @income_loss_house_property
    assert_response :success
  end

  test "should update income_loss_house_property" do
    patch :update, id: @income_loss_house_property, income_loss_house_property: { actual_total_amt: @income_loss_house_property.actual_total_amt, estimated_total_amt: @income_loss_house_property.estimated_total_amt, income: @income_loss_house_property.income, investment_declaration_id: @income_loss_house_property.investment_declaration_id, less_interest: @income_loss_house_property.less_interest, less_pre_emi_interest: @income_loss_house_property.less_pre_emi_interest, less_repairs: @income_loss_house_property.less_repairs, less_taxes: @income_loss_house_property.less_taxes, property_type: @income_loss_house_property.property_type, rental_income: @income_loss_house_property.rental_income, total: @income_loss_house_property.total }
    assert_redirected_to income_loss_house_property_path(assigns(:income_loss_house_property))
  end

  test "should destroy income_loss_house_property" do
    assert_difference('IncomeLossHouseProperty.count', -1) do
      delete :destroy, id: @income_loss_house_property
    end

    assert_redirected_to income_loss_house_properties_path
  end
end
