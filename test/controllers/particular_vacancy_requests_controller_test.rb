require 'test_helper'

class ParticularVacancyRequestsControllerTest < ActionController::TestCase
  setup do
    @particular_vacancy_request = particular_vacancy_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:particular_vacancy_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create particular_vacancy_request" do
    assert_difference('ParticularVacancyRequest.count') do
      post :create, particular_vacancy_request: { closed_date: @particular_vacancy_request.closed_date, employee_id: @particular_vacancy_request.employee_id, fulfillment_date: @particular_vacancy_request.fulfillment_date, open_date: @particular_vacancy_request.open_date, status: @particular_vacancy_request.status, vacancy_master_id: @particular_vacancy_request.vacancy_master_id }
    end

    assert_redirected_to particular_vacancy_request_path(assigns(:particular_vacancy_request))
  end

  test "should show particular_vacancy_request" do
    get :show, id: @particular_vacancy_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @particular_vacancy_request
    assert_response :success
  end

  test "should update particular_vacancy_request" do
    patch :update, id: @particular_vacancy_request, particular_vacancy_request: { closed_date: @particular_vacancy_request.closed_date, employee_id: @particular_vacancy_request.employee_id, fulfillment_date: @particular_vacancy_request.fulfillment_date, open_date: @particular_vacancy_request.open_date, status: @particular_vacancy_request.status, vacancy_master_id: @particular_vacancy_request.vacancy_master_id }
    assert_redirected_to particular_vacancy_request_path(assigns(:particular_vacancy_request))
  end

  test "should destroy particular_vacancy_request" do
    assert_difference('ParticularVacancyRequest.count', -1) do
      delete :destroy, id: @particular_vacancy_request
    end

    assert_redirected_to particular_vacancy_requests_path
  end
end
