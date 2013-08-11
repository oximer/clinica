require 'test_helper'

class PayersControllerTest < ActionController::TestCase
  setup do
    @payer = payers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:payers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create payer" do
    assert_difference('Payer.count') do
      post :create, payer: { date: @payer.date, payment_id: @payer.payment_id, treatment_id: @payer.treatment_id }
    end

    assert_redirected_to payer_path(assigns(:payer))
  end

  test "should show payer" do
    get :show, id: @payer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @payer
    assert_response :success
  end

  test "should update payer" do
    patch :update, id: @payer, payer: { date: @payer.date, payment_id: @payer.payment_id, treatment_id: @payer.treatment_id }
    assert_redirected_to payer_path(assigns(:payer))
  end

  test "should destroy payer" do
    assert_difference('Payer.count', -1) do
      delete :destroy, id: @payer
    end

    assert_redirected_to payers_path
  end
end
