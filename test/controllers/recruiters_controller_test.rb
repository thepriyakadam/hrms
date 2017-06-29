require 'test_helper'

class RecruitersControllerTest < ActionController::TestCase
  setup do
    @recruiter = recruiters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recruiters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recruiter" do
    assert_difference('Recruiter.count') do
      post :create, recruiter: { employee_id: @recruiter.employee_id, status: @recruiter.status }
    end

    assert_redirected_to recruiter_path(assigns(:recruiter))
  end

  test "should show recruiter" do
    get :show, id: @recruiter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recruiter
    assert_response :success
  end

  test "should update recruiter" do
    patch :update, id: @recruiter, recruiter: { employee_id: @recruiter.employee_id, status: @recruiter.status }
    assert_redirected_to recruiter_path(assigns(:recruiter))
  end

  test "should destroy recruiter" do
    assert_difference('Recruiter.count', -1) do
      delete :destroy, id: @recruiter
    end

    assert_redirected_to recruiters_path
  end
end
