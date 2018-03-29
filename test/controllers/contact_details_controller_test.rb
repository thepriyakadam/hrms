require 'test_helper'

class ContactDetailsControllerTest < ActionController::TestCase
  setup do
    @contact_detail = contact_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contact_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contact_detail" do
    assert_difference('ContactDetail.count') do
      post :create, contact_detail: { description: @contact_detail.description, employee_id: @contact_detail.employee_id, name: @contact_detail.name, status: @contact_detail.status }
    end

    assert_redirected_to contact_detail_path(assigns(:contact_detail))
  end

  test "should show contact_detail" do
    get :show, id: @contact_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contact_detail
    assert_response :success
  end

  test "should update contact_detail" do
    patch :update, id: @contact_detail, contact_detail: { description: @contact_detail.description, employee_id: @contact_detail.employee_id, name: @contact_detail.name, status: @contact_detail.status }
    assert_redirected_to contact_detail_path(assigns(:contact_detail))
  end

  test "should destroy contact_detail" do
    assert_difference('ContactDetail.count', -1) do
      delete :destroy, id: @contact_detail
    end

    assert_redirected_to contact_details_path
  end
end
