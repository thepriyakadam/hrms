require 'test_helper'

class FamiliesControllerTest < ActionController::TestCase
  setup do
    @family = families(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:families)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create family' do
    assert_difference('Family.count') do
      post :create, family: { adhar_no: @family.adhar_no, age: @family.age, blood_group: @family.blood_group, city: @family.city, contact_no: @family.contact_no, current_address: @family.current_address, date_of_birth: @family.date_of_birth, dist: @family.dist, email: @family.email, employee_id: @family.employee_id, f_name: @family.f_name, l_name: @family.l_name, m_name: @family.m_name, m_name: @family.m_name, marital: @family.marital, medical_claim: @family.medical_claim, nationality_id: @family.nationality_id, no_of_member: @family.no_of_member, pan_no: @family.pan_no, passport_no: @family.passport_no, permanent_address: @family.permanent_address, phandicap: @family.phandicap, phone_no: @family.phone_no, pin_code: @family.pin_code, profession: @family.profession, relation: @family.relation, religion: @family.religion, state: @family.state, status: @family.status }
    end

    assert_redirected_to family_path(assigns(:family))
  end

  test 'should show family' do
    get :show, id: @family
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @family
    assert_response :success
  end

  test 'should update family' do
    patch :update, id: @family, family: { adhar_no: @family.adhar_no, age: @family.age, blood_group: @family.blood_group, city: @family.city, contact_no: @family.contact_no, current_address: @family.current_address, date_of_birth: @family.date_of_birth, dist: @family.dist, email: @family.email, employee_id: @family.employee_id, f_name: @family.f_name, l_name: @family.l_name, m_name: @family.m_name, m_name: @family.m_name, marital: @family.marital, medical_claim: @family.medical_claim, nationality_id: @family.nationality_id, no_of_member: @family.no_of_member, pan_no: @family.pan_no, passport_no: @family.passport_no, permanent_address: @family.permanent_address, phandicap: @family.phandicap, phone_no: @family.phone_no, pin_code: @family.pin_code, profession: @family.profession, relation: @family.relation, religion: @family.religion, state: @family.state, status: @family.status }
    assert_redirected_to family_path(assigns(:family))
  end

  test 'should destroy family' do
    assert_difference('Family.count', -1) do
      delete :destroy, id: @family
    end

    assert_redirected_to families_path
  end
end
