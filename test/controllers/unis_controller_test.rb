require 'test_helper'

class UnisControllerTest < ActionController::TestCase
  setup do
    @uni = unis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:unis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create uni" do
    assert_difference('Uni.count') do
      post :create, uni: { batch_id: @uni.batch_id, rand_num: @uni.rand_num, user_id: @uni.user_id }
    end

    assert_redirected_to uni_path(assigns(:uni))
  end

  test "should show uni" do
    get :show, id: @uni
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @uni
    assert_response :success
  end

  test "should update uni" do
    patch :update, id: @uni, uni: { batch_id: @uni.batch_id, rand_num: @uni.rand_num, user_id: @uni.user_id }
    assert_redirected_to uni_path(assigns(:uni))
  end

  test "should destroy uni" do
    assert_difference('Uni.count', -1) do
      delete :destroy, id: @uni
    end

    assert_redirected_to unis_path
  end
end
