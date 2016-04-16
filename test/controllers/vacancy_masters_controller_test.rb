require 'test_helper'

class VacancyMastersControllerTest < ActionController::TestCase
  setup do
    @vacancy_master = vacancy_masters(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:vacancy_masters)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create vacancy_master' do
    assert_difference('VacancyMaster.count') do
      post :create, vacancy_master: { budget: @vacancy_master.budget, department_name: @vacancy_master.department_name, description: @vacancy_master.description, educational_qualification: @vacancy_master.educational_qualification, job_title: @vacancy_master.job_title, no_of_position: @vacancy_master.no_of_position, vacancy_name: @vacancy_master.vacancy_name, vacancy_post_date: @vacancy_master.vacancy_post_date }
    end

    assert_redirected_to vacancy_master_path(assigns(:vacancy_master))
  end

  test 'should show vacancy_master' do
    get :show, id: @vacancy_master
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @vacancy_master
    assert_response :success
  end

  test 'should update vacancy_master' do
    patch :update, id: @vacancy_master, vacancy_master: { budget: @vacancy_master.budget, department_name: @vacancy_master.department_name, description: @vacancy_master.description, educational_qualification: @vacancy_master.educational_qualification, job_title: @vacancy_master.job_title, no_of_position: @vacancy_master.no_of_position, vacancy_name: @vacancy_master.vacancy_name, vacancy_post_date: @vacancy_master.vacancy_post_date }
    assert_redirected_to vacancy_master_path(assigns(:vacancy_master))
  end

  test 'should destroy vacancy_master' do
    assert_difference('VacancyMaster.count', -1) do
      delete :destroy, id: @vacancy_master
    end

    assert_redirected_to vacancy_masters_path
  end
end
