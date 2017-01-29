require 'test_helper'

class DownloadPdfControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get zip" do
    get :zip
    assert_response :success
  end

  test "should get pdf" do
    get :pdf
    assert_response :success
  end

  test "should get doc" do
    get :doc
    assert_response :success
  end

end
