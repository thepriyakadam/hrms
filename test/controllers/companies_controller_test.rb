require 'test_helper'

class CompaniesControllerTest < ActionController::TestCase
  setup do
    @company = companies(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:companies)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create company' do
    assert_difference('Company.count') do
      post :create, company: { address: @company.address, ceo_name: @company.ceo_name, city: @company.city, company_type: @company.company_type, contact_no: @company.contact_no, district: @company.district, email: @company.email, group_id: @company.group_id, name: @company.name, pan_card_no: @company.pan_card_no, pin_code: @company.pin_code, professional_tax_no: @company.professional_tax_no, registration_no: @company.registration_no, starting_date: @company.starting_date, state: @company.state, tax_no: @company.tax_no, web_site: @company.web_site }
    end

    assert_redirected_to company_path(assigns(:company))
  end

  test 'should show company' do
    get :show, id: @company
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @company
    assert_response :success
  end

  test 'should update company' do
    patch :update, id: @company, company: { address: @company.address, ceo_name: @company.ceo_name, city: @company.city, company_type: @company.company_type, contact_no: @company.contact_no, district: @company.district, email: @company.email, group_id: @company.group_id, name: @company.name, pan_card_no: @company.pan_card_no, pin_code: @company.pin_code, professional_tax_no: @company.professional_tax_no, registration_no: @company.registration_no, starting_date: @company.starting_date, state: @company.state, tax_no: @company.tax_no, web_site: @company.web_site }
    assert_redirected_to company_path(assigns(:company))
  end

  test 'should destroy company' do
    assert_difference('Company.count', -1) do
      delete :destroy, id: @company
    end

    assert_redirected_to companies_path
  end
end
