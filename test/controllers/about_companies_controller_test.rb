require 'test_helper'

class AboutCompaniesControllerTest < ActionController::TestCase
  setup do
    @about_company = about_companies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:about_companies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create about_company" do
    assert_difference('AboutCompany.count') do
      post :create, about_company: { code: @about_company.code, description: @about_company.description, name: @about_company.name, status: @about_company.status }
    end

    assert_redirected_to about_company_path(assigns(:about_company))
  end

  test "should show about_company" do
    get :show, id: @about_company
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @about_company
    assert_response :success
  end

  test "should update about_company" do
    patch :update, id: @about_company, about_company: { code: @about_company.code, description: @about_company.description, name: @about_company.name, status: @about_company.status }
    assert_redirected_to about_company_path(assigns(:about_company))
  end

  test "should destroy about_company" do
    assert_difference('AboutCompany.count', -1) do
      delete :destroy, id: @about_company
    end

    assert_redirected_to about_companies_path
  end
end
