require 'test_helper'

class AttributeRatingSheetsControllerTest < ActionController::TestCase
  setup do
    @attribute_rating_sheet = attribute_rating_sheets(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:attribute_rating_sheets)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create attribute_rating_sheet' do
    assert_difference('AttributeRatingSheet.count') do
      post :create, attribute_rating_sheet: { appraisee_comment: @attribute_rating_sheet.appraisee_comment, appraisee_id: @attribute_rating_sheet.appraisee_id, appraisee_rating: @attribute_rating_sheet.appraisee_rating, appraiser_comment: @attribute_rating_sheet.appraiser_comment, appraiser_id: @attribute_rating_sheet.appraiser_id, appraiser_rating: @attribute_rating_sheet.appraiser_rating, employee_attribute_id: @attribute_rating_sheet.employee_attribute_id }
    end

    assert_redirected_to attribute_rating_sheet_path(assigns(:attribute_rating_sheet))
  end

  test 'should show attribute_rating_sheet' do
    get :show, id: @attribute_rating_sheet
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @attribute_rating_sheet
    assert_response :success
  end

  test 'should update attribute_rating_sheet' do
    patch :update, id: @attribute_rating_sheet, attribute_rating_sheet: { appraisee_comment: @attribute_rating_sheet.appraisee_comment, appraisee_id: @attribute_rating_sheet.appraisee_id, appraisee_rating: @attribute_rating_sheet.appraisee_rating, appraiser_comment: @attribute_rating_sheet.appraiser_comment, appraiser_id: @attribute_rating_sheet.appraiser_id, appraiser_rating: @attribute_rating_sheet.appraiser_rating, employee_attribute_id: @attribute_rating_sheet.employee_attribute_id }
    assert_redirected_to attribute_rating_sheet_path(assigns(:attribute_rating_sheet))
  end

  test 'should destroy attribute_rating_sheet' do
    assert_difference('AttributeRatingSheet.count', -1) do
      delete :destroy, id: @attribute_rating_sheet
    end

    assert_redirected_to attribute_rating_sheets_path
  end
end
