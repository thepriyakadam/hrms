require 'test_helper'

class PreOnboardingsControllerTest < ActionController::TestCase
  setup do
    @pre_onboarding = pre_onboardings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pre_onboardings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pre_onboarding" do
    assert_difference('PreOnboarding.count') do
      post :create, pre_onboarding: { adhar_no: @pre_onboarding.adhar_no, birth_date: @pre_onboarding.birth_date, city: @pre_onboarding.city, contact_no: @pre_onboarding.contact_no, country_id: @pre_onboarding.country_id, current_address: @pre_onboarding.current_address, district_id: @pre_onboarding.district_id, email: @pre_onboarding.email, fathers_name: @pre_onboarding.fathers_name, first_name: @pre_onboarding.first_name, gender: @pre_onboarding.gender, last_name: @pre_onboarding.last_name, marital_status: @pre_onboarding.marital_status, middle_name: @pre_onboarding.middle_name, nationality: @pre_onboarding.nationality, optional_no: @pre_onboarding.optional_no, pan_no: @pre_onboarding.pan_no, permanent_address: @pre_onboarding.permanent_address, pin_code: @pre_onboarding.pin_code, selected_resume_id: @pre_onboarding.selected_resume_id, state_id: @pre_onboarding.state_id }
    end

    assert_redirected_to pre_onboarding_path(assigns(:pre_onboarding))
  end

  test "should show pre_onboarding" do
    get :show, id: @pre_onboarding
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pre_onboarding
    assert_response :success
  end

  test "should update pre_onboarding" do
    patch :update, id: @pre_onboarding, pre_onboarding: { adhar_no: @pre_onboarding.adhar_no, birth_date: @pre_onboarding.birth_date, city: @pre_onboarding.city, contact_no: @pre_onboarding.contact_no, country_id: @pre_onboarding.country_id, current_address: @pre_onboarding.current_address, district_id: @pre_onboarding.district_id, email: @pre_onboarding.email, fathers_name: @pre_onboarding.fathers_name, first_name: @pre_onboarding.first_name, gender: @pre_onboarding.gender, last_name: @pre_onboarding.last_name, marital_status: @pre_onboarding.marital_status, middle_name: @pre_onboarding.middle_name, nationality: @pre_onboarding.nationality, optional_no: @pre_onboarding.optional_no, pan_no: @pre_onboarding.pan_no, permanent_address: @pre_onboarding.permanent_address, pin_code: @pre_onboarding.pin_code, selected_resume_id: @pre_onboarding.selected_resume_id, state_id: @pre_onboarding.state_id }
    assert_redirected_to pre_onboarding_path(assigns(:pre_onboarding))
  end

  test "should destroy pre_onboarding" do
    assert_difference('PreOnboarding.count', -1) do
      delete :destroy, id: @pre_onboarding
    end

    assert_redirected_to pre_onboardings_path
  end
end
