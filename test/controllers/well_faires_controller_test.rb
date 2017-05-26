require 'test_helper'

class WellFairesControllerTest < ActionController::TestCase
  setup do
    @well_faire = well_faires(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:well_faires)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create well_faire' do
    assert_difference('WellFaire.count') do
      post :create, well_faire: { amount: @well_faire.amount, month: @well_faire.month, status: @well_faire.status }
    end

    assert_redirected_to well_faire_path(assigns(:well_faire))
  end

  test 'should show well_faire' do
    get :show, id: @well_faire
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @well_faire
    assert_response :success
  end

  test 'should update well_faire' do
    patch :update, id: @well_faire, well_faire: { amount: @well_faire.amount, month: @well_faire.month, status: @well_faire.status }
    assert_redirected_to well_faire_path(assigns(:well_faire))
  end

  test 'should destroy well_faire' do
    assert_difference('WellFaire.count', -1) do
      delete :destroy, id: @well_faire
    end

    assert_redirected_to well_faires_path
  end
end
