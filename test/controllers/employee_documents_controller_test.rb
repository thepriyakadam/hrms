require 'test_helper'

class EmployeeDocumentsControllerTest < ActionController::TestCase
  setup do
    @employee_document = employee_documents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employee_documents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employee_document" do
    assert_difference('EmployeeDocument.count') do
      post :create, employee_document: { employee_id: @employee_document.employee_id, name: @employee_document.name, status: @employee_document.status }
    end

    assert_redirected_to employee_document_path(assigns(:employee_document))
  end

  test "should show employee_document" do
    get :show, id: @employee_document
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employee_document
    assert_response :success
  end

  test "should update employee_document" do
    patch :update, id: @employee_document, employee_document: { employee_id: @employee_document.employee_id, name: @employee_document.name, status: @employee_document.status }
    assert_redirected_to employee_document_path(assigns(:employee_document))
  end

  test "should destroy employee_document" do
    assert_difference('EmployeeDocument.count', -1) do
      delete :destroy, id: @employee_document
    end

    assert_redirected_to employee_documents_path
  end
end
