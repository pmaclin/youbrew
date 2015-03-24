require 'test_helper'

class BatchesControllerTest < ActionController::TestCase
  setup do
    @batch = batches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:batches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create batch" do
    assert_difference('Batch.count') do
      post :create, batch: { aabv: @batch.aabv, aaroma: @batch.aaroma, afg: @batch.afg, aflavpro: @batch.aflavpro, aibu: @batch.aibu, aog: @batch.aog, bottle_date: @batch.bottle_date, brew_date: @batch.brew_date, image: @batch.image, recipe_id: @batch.recipe_id, size: @batch.size, user_id: @batch.user_id }
    end

    assert_redirected_to batch_path(assigns(:batch))
  end

  test "should show batch" do
    get :show, id: @batch
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @batch
    assert_response :success
  end

  test "should update batch" do
    patch :update, id: @batch, batch: { aabv: @batch.aabv, aaroma: @batch.aaroma, afg: @batch.afg, aflavpro: @batch.aflavpro, aibu: @batch.aibu, aog: @batch.aog, bottle_date: @batch.bottle_date, brew_date: @batch.brew_date, image: @batch.image, recipe_id: @batch.recipe_id, size: @batch.size, user_id: @batch.user_id }
    assert_redirected_to batch_path(assigns(:batch))
  end

  test "should destroy batch" do
    assert_difference('Batch.count', -1) do
      delete :destroy, id: @batch
    end

    assert_redirected_to batches_path
  end
end
