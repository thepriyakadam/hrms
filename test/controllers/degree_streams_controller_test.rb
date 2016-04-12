require 'test_helper'

class DegreeStreamsControllerTest < ActionController::TestCase
  setup do
    @degree_stream = degree_streams(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:degree_streams)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create degree_stream' do
    assert_difference('DegreeStream.count') do
      post :create, degree_stream: { name: @degree_stream.name }
    end

    assert_redirected_to degree_stream_path(assigns(:degree_stream))
  end

  test 'should show degree_stream' do
    get :show, id: @degree_stream
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @degree_stream
    assert_response :success
  end

  test 'should update degree_stream' do
    patch :update, id: @degree_stream, degree_stream: { name: @degree_stream.name }
    assert_redirected_to degree_stream_path(assigns(:degree_stream))
  end

  test 'should destroy degree_stream' do
    assert_difference('DegreeStream.count', -1) do
      delete :destroy, id: @degree_stream
    end

    assert_redirected_to degree_streams_path
  end
end
