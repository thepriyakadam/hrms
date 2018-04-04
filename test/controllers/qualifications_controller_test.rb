require 'test_helper'

class QualificationsControllerTest < ActionController::TestCase
  setup do
    @qualification = qualifications(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:qualifications)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create qualification' do
    assert_difference('Qualification.count') do
      post :create, qualification: { deploma: @qualification.deploma, deploma_from: @qualification.deploma_from, deploma_marks: @qualification.deploma_marks, deploma_university: @qualification.deploma_university, deploma_year: @qualification.deploma_year, employee_id: @qualification.employee_id, hsc: @qualification.hsc, hsc_bord: @qualification.hsc_bord, hsc_from: @qualification.hsc_from, hsc_marks: @qualification.hsc_marks, hsc_year: @qualification.hsc_year, pg: @qualification.pg, pg_from: @qualification.pg_from, pg_marks: @qualification.pg_marks, pg_university: @qualification.pg_university, pg_yaer: @qualification.pg_yaer, ssc: @qualification.ssc, ssc_bord: @qualification.ssc_bord, ssc_from: @qualification.ssc_from, ssc_marks: @qualification.ssc_marks, ssc_year: @qualification.ssc_year, ug: @qualification.ug, ug_from: @qualification.ug_from, ug_marks: @qualification.ug_marks, ug_university: @qualification.ug_university, ug_year: @qualification.ug_year }
    end

    assert_redirected_to qualification_path(assigns(:qualification))
  end

  test 'should show qualification' do
    get :show, id: @qualification
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @qualification
    assert_response :success
  end

  test 'should update qualification' do
    patch :update, id: @qualification, qualification: { deploma: @qualification.deploma, deploma_from: @qualification.deploma_from, deploma_marks: @qualification.deploma_marks, deploma_university: @qualification.deploma_university, deploma_year: @qualification.deploma_year, employee_id: @qualification.employee_id, hsc: @qualification.hsc, hsc_bord: @qualification.hsc_bord, hsc_from: @qualification.hsc_from, hsc_marks: @qualification.hsc_marks, hsc_year: @qualification.hsc_year, pg: @qualification.pg, pg_from: @qualification.pg_from, pg_marks: @qualification.pg_marks, pg_university: @qualification.pg_university, pg_yaer: @qualification.pg_yaer, ssc: @qualification.ssc, ssc_bord: @qualification.ssc_bord, ssc_from: @qualification.ssc_from, ssc_marks: @qualification.ssc_marks, ssc_year: @qualification.ssc_year, ug: @qualification.ug, ug_from: @qualification.ug_from, ug_marks: @qualification.ug_marks, ug_university: @qualification.ug_university, ug_year: @qualification.ug_year }
    assert_redirected_to qualification_path(assigns(:qualification))
  end

  test 'should destroy qualification' do
    assert_difference('Qualification.count', -1) do
      delete :destroy, id: @qualification
    end

    assert_redirected_to qualifications_path
  end
end
