require 'test_helper'

class AboutBossesControllerTest < ActionController::TestCase
  setup do
    @about_boss = about_bosses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:about_bosses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create about_boss" do
    assert_difference('AboutBoss.count') do
      post :create, about_boss: { code: @about_boss.code, description: @about_boss.description, name: @about_boss.name, status: @about_boss.status }
    end

    assert_redirected_to about_boss_path(assigns(:about_boss))
  end

  test "should show about_boss" do
    get :show, id: @about_boss
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @about_boss
    assert_response :success
  end

  test "should update about_boss" do
    patch :update, id: @about_boss, about_boss: { code: @about_boss.code, description: @about_boss.description, name: @about_boss.name, status: @about_boss.status }
    assert_redirected_to about_boss_path(assigns(:about_boss))
  end

  test "should destroy about_boss" do
    assert_difference('AboutBoss.count', -1) do
      delete :destroy, id: @about_boss
    end

    assert_redirected_to about_bosses_path
  end
end
