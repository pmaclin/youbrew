require 'test_helper'

class MirrorsControllerTest < ActionController::TestCase
  setup do
    @mirror = mirrors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mirrors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mirror" do
    assert_difference('Mirror.count') do
      post :create, mirror: { mrand_num: @mirror.mrand_num, unique_id: @mirror.unique_id }
    end

    assert_redirected_to mirror_path(assigns(:mirror))
  end

  test "should show mirror" do
    get :show, id: @mirror
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mirror
    assert_response :success
  end

  test "should update mirror" do
    patch :update, id: @mirror, mirror: { mrand_num: @mirror.mrand_num, unique_id: @mirror.unique_id }
    assert_redirected_to mirror_path(assigns(:mirror))
  end

  test "should destroy mirror" do
    assert_difference('Mirror.count', -1) do
      delete :destroy, id: @mirror
    end

    assert_redirected_to mirrors_path
  end
end
