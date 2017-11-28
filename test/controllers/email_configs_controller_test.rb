require 'test_helper'

class EmailConfigsControllerTest < ActionController::TestCase
  setup do
    @email_config = email_configs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:email_configs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create email_config" do
    assert_difference('EmailConfig.count') do
      post :create, email_config: { address: @email_config.address, authentication: @email_config.authentication, delivery_method: @email_config.delivery_method, port: @email_config.port, pwd: @email_config.pwd, url_host: @email_config.url_host, url_port: @email_config.url_port, username: @email_config.username }
    end

    assert_redirected_to email_config_path(assigns(:email_config))
  end

  test "should show email_config" do
    get :show, id: @email_config
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @email_config
    assert_response :success
  end

  test "should update email_config" do
    patch :update, id: @email_config, email_config: { address: @email_config.address, authentication: @email_config.authentication, delivery_method: @email_config.delivery_method, port: @email_config.port, pwd: @email_config.pwd, url_host: @email_config.url_host, url_port: @email_config.url_port, username: @email_config.username }
    assert_redirected_to email_config_path(assigns(:email_config))
  end

  test "should destroy email_config" do
    assert_difference('EmailConfig.count', -1) do
      delete :destroy, id: @email_config
    end

    assert_redirected_to email_configs_path
  end
end
