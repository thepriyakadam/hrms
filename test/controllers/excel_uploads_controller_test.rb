require 'test_helper'

class ExcelUploadsControllerTest < ActionController::TestCase
  setup do
    @excel_upload = excel_uploads(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:excel_uploads)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create excel_upload' do
    assert_difference('ExcelUpload.count') do
      post :create, excel_upload: { code: @excel_upload.code, file_name: @excel_upload.file_name, size: @excel_upload.size }
    end

    assert_redirected_to excel_upload_path(assigns(:excel_upload))
  end

  test 'should show excel_upload' do
    get :show, id: @excel_upload
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @excel_upload
    assert_response :success
  end

  test 'should update excel_upload' do
    patch :update, id: @excel_upload, excel_upload: { code: @excel_upload.code, file_name: @excel_upload.file_name, size: @excel_upload.size }
    assert_redirected_to excel_upload_path(assigns(:excel_upload))
  end

  test 'should destroy excel_upload' do
    assert_difference('ExcelUpload.count', -1) do
      delete :destroy, id: @excel_upload
    end

    assert_redirected_to excel_uploads_path
  end
end
