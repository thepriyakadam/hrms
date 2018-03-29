require 'test_helper'

class EsicEmployersControllerTest < ActionController::TestCase
  setup do
    @esic_employer = esic_employers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:esic_employers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create esic_employer" do
    assert_difference('EsicEmployer.count') do
      post :create, esic_employer: { base_component: @esic_employer.base_component, effective_from: @esic_employer.effective_from, effective_to: @esic_employer.effective_to, is_active: @esic_employer.is_active, is_confirm: @esic_employer.is_confirm, percentage: @esic_employer.percentage }
    end

    assert_redirected_to esic_employer_path(assigns(:esic_employer))
  end

  test "should show esic_employer" do
    get :show, id: @esic_employer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @esic_employer
    assert_response :success
  end

  test "should update esic_employer" do
    patch :update, id: @esic_employer, esic_employer: { base_component: @esic_employer.base_component, effective_from: @esic_employer.effective_from, effective_to: @esic_employer.effective_to, is_active: @esic_employer.is_active, is_confirm: @esic_employer.is_confirm, percentage: @esic_employer.percentage }
    assert_redirected_to esic_employer_path(assigns(:esic_employer))
  end

  test "should destroy esic_employer" do
    assert_difference('EsicEmployer.count', -1) do
      delete :destroy, id: @esic_employer
    end

    assert_redirected_to esic_employers_path
  end
end
