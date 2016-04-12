require 'test_helper'

class EmployeeAttributesControllerTest < ActionController::TestCase
  setup do
    @employee_attribute = employee_attributes(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:employee_attributes)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create employee_attribute' do
    assert_difference('EmployeeAttribute.count') do
      post :create, employee_attribute: { appraisee_comment: @employee_attribute.appraisee_comment, appraisee_id: @employee_attribute.appraisee_id, appraisee_rating: @employee_attribute.appraisee_rating, appraiser_comment: @employee_attribute.appraiser_comment, appraiser_id: @employee_attribute.appraiser_id, appraiser_rating: @employee_attribute.appraiser_rating, attribute_master_id: @employee_attribute.attribute_master_id, definition_id: @employee_attribute.definition_id, weightage: @employee_attribute.weightage }
    end

    assert_redirected_to employee_attribute_path(assigns(:employee_attribute))
  end

  test 'should show employee_attribute' do
    get :show, id: @employee_attribute
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @employee_attribute
    assert_response :success
  end

  test 'should update employee_attribute' do
    patch :update, id: @employee_attribute, employee_attribute: { appraisee_comment: @employee_attribute.appraisee_comment, appraisee_id: @employee_attribute.appraisee_id, appraisee_rating: @employee_attribute.appraisee_rating, appraiser_comment: @employee_attribute.appraiser_comment, appraiser_id: @employee_attribute.appraiser_id, appraiser_rating: @employee_attribute.appraiser_rating, attribute_master_id: @employee_attribute.attribute_master_id, definition_id: @employee_attribute.definition_id, weightage: @employee_attribute.weightage }
    assert_redirected_to employee_attribute_path(assigns(:employee_attribute))
  end

  test 'should destroy employee_attribute' do
    assert_difference('EmployeeAttribute.count', -1) do
      delete :destroy, id: @employee_attribute
    end

    assert_redirected_to employee_attributes_path
  end
end
