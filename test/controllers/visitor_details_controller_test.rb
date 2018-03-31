require 'test_helper'

class VisitorDetailsControllerTest < ActionController::TestCase
  setup do
    @visitor_detail = visitor_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:visitor_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create visitor_detail" do
    assert_difference('VisitorDetail.count') do
      post :create, visitor_detail: { age: @visitor_detail.age, authorized_by_id: @visitor_detail.authorized_by_id, contact_no: @visitor_detail.contact_no, email_id: @visitor_detail.email_id, from: @visitor_detail.from, id_proof: @visitor_detail.id_proof, in_time: @visitor_detail.in_time, meet_to_id: @visitor_detail.meet_to_id, name: @visitor_detail.name, out_time: @visitor_detail.out_time, purpose: @visitor_detail.purpose }
    end

    assert_redirected_to visitor_detail_path(assigns(:visitor_detail))
  end

  test "should show visitor_detail" do
    get :show, id: @visitor_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @visitor_detail
    assert_response :success
  end

  test "should update visitor_detail" do
    patch :update, id: @visitor_detail, visitor_detail: { age: @visitor_detail.age, authorized_by_id: @visitor_detail.authorized_by_id, contact_no: @visitor_detail.contact_no, email_id: @visitor_detail.email_id, from: @visitor_detail.from, id_proof: @visitor_detail.id_proof, in_time: @visitor_detail.in_time, meet_to_id: @visitor_detail.meet_to_id, name: @visitor_detail.name, out_time: @visitor_detail.out_time, purpose: @visitor_detail.purpose }
    assert_redirected_to visitor_detail_path(assigns(:visitor_detail))
  end

  test "should destroy visitor_detail" do
    assert_difference('VisitorDetail.count', -1) do
      delete :destroy, id: @visitor_detail
    end

    assert_redirected_to visitor_details_path
  end
end
