require 'test_helper'

class VacancyRequestsControllerTest < ActionController::TestCase
  setup do
    @vacancy_request = vacancy_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vacancy_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vacancy_request" do
    assert_difference('VacancyRequest.count') do
      post :create, vacancy_request: { approval_by_id: @vacancy_request.approval_by_id, current_status: @vacancy_request.current_status, department_id: @vacancy_request.department_id, description: @vacancy_request.description, designation_id: @vacancy_request.designation_id, experience: @vacancy_request.experience, no_of_position: @vacancy_request.no_of_position, qualification: @vacancy_request.qualification, request_by_id: @vacancy_request.request_by_id, request_date: @vacancy_request.request_date, skill_set: @vacancy_request.skill_set, vacancy: @vacancy_request.vacancy, vacancy_type: @vacancy_request.vacancy_type }
    end

    assert_redirected_to vacancy_request_path(assigns(:vacancy_request))
  end

  test "should show vacancy_request" do
    get :show, id: @vacancy_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vacancy_request
    assert_response :success
  end

  test "should update vacancy_request" do
    patch :update, id: @vacancy_request, vacancy_request: { approval_by_id: @vacancy_request.approval_by_id, current_status: @vacancy_request.current_status, department_id: @vacancy_request.department_id, description: @vacancy_request.description, designation_id: @vacancy_request.designation_id, experience: @vacancy_request.experience, no_of_position: @vacancy_request.no_of_position, qualification: @vacancy_request.qualification, request_by_id: @vacancy_request.request_by_id, request_date: @vacancy_request.request_date, skill_set: @vacancy_request.skill_set, vacancy: @vacancy_request.vacancy, vacancy_type: @vacancy_request.vacancy_type }
    assert_redirected_to vacancy_request_path(assigns(:vacancy_request))
  end

  test "should destroy vacancy_request" do
    assert_difference('VacancyRequest.count', -1) do
      delete :destroy, id: @vacancy_request
    end

    assert_redirected_to vacancy_requests_path
  end
end
