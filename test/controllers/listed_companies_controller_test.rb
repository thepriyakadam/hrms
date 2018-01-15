require 'test_helper'

class ListedCompaniesControllerTest < ActionController::TestCase
  setup do
    @listed_company = listed_companies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:listed_companies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create listed_company" do
    assert_difference('ListedCompany.count') do
      post :create, listed_company: { contact_no: @listed_company.contact_no, email: @listed_company.email, location: @listed_company.location, name: @listed_company.name }
    end

    assert_redirected_to listed_company_path(assigns(:listed_company))
  end

  test "should show listed_company" do
    get :show, id: @listed_company
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @listed_company
    assert_response :success
  end

  test "should update listed_company" do
    patch :update, id: @listed_company, listed_company: { contact_no: @listed_company.contact_no, email: @listed_company.email, location: @listed_company.location, name: @listed_company.name }
    assert_redirected_to listed_company_path(assigns(:listed_company))
  end

  test "should destroy listed_company" do
    assert_difference('ListedCompany.count', -1) do
      delete :destroy, id: @listed_company
    end

    assert_redirected_to listed_companies_path
  end
end
