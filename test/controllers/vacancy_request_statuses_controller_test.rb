require 'test_helper'

class VacancyRequestStatusesControllerTest < ActionController::TestCase
  setup do
    @vacancy_request_status = vacancy_request_statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vacancy_request_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vacancy_request_status" do
    assert_difference('VacancyRequestStatus.count') do
      post :create, vacancy_request_status: { action_by_id: @vacancy_request_status.action_by_id, action_date: @vacancy_request_status.action_date, status: @vacancy_request_status.status, vacancy_request_id: @vacancy_request_status.vacancy_request_id }
    end

    assert_redirected_to vacancy_request_status_path(assigns(:vacancy_request_status))
  end

  test "should show vacancy_request_status" do
    get :show, id: @vacancy_request_status
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vacancy_request_status
    assert_response :success
  end

  test "should update vacancy_request_status" do
    patch :update, id: @vacancy_request_status, vacancy_request_status: { action_by_id: @vacancy_request_status.action_by_id, action_date: @vacancy_request_status.action_date, status: @vacancy_request_status.status, vacancy_request_id: @vacancy_request_status.vacancy_request_id }
    assert_redirected_to vacancy_request_status_path(assigns(:vacancy_request_status))
  end

  test "should destroy vacancy_request_status" do
    assert_difference('VacancyRequestStatus.count', -1) do
      delete :destroy, id: @vacancy_request_status
    end

    assert_redirected_to vacancy_request_statuses_path
  end
end
