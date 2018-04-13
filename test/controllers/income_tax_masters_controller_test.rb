require 'test_helper'

class IncomeTaxMastersControllerTest < ActionController::TestCase
  setup do
    @income_tax_master = income_tax_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:income_tax_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create income_tax_master" do
    assert_difference('IncomeTaxMaster.count') do
      post :create, income_tax_master: { designation: @income_tax_master.designation, name: @income_tax_master.name, relation: @income_tax_master.relation, second_name: @income_tax_master.second_name, status: @income_tax_master.status }
    end

    assert_redirected_to income_tax_master_path(assigns(:income_tax_master))
  end

  test "should show income_tax_master" do
    get :show, id: @income_tax_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @income_tax_master
    assert_response :success
  end

  test "should update income_tax_master" do
    patch :update, id: @income_tax_master, income_tax_master: { designation: @income_tax_master.designation, name: @income_tax_master.name, relation: @income_tax_master.relation, second_name: @income_tax_master.second_name, status: @income_tax_master.status }
    assert_redirected_to income_tax_master_path(assigns(:income_tax_master))
  end

  test "should destroy income_tax_master" do
    assert_difference('IncomeTaxMaster.count', -1) do
      delete :destroy, id: @income_tax_master
    end

    assert_redirected_to income_tax_masters_path
  end
end
