require 'test_helper'

class InsuredsControllerTest < ActionController::TestCase
  setup do
    @insured = insureds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:insureds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create insured" do
    assert_difference('Insured.count') do
      post :create, insured: { insurance_id: @insured.insurance_id, pacient_id: @insured.pacient_id }
    end

    assert_redirected_to insured_path(assigns(:insured))
  end

  test "should show insured" do
    get :show, id: @insured
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @insured
    assert_response :success
  end

  test "should update insured" do
    patch :update, id: @insured, insured: { insurance_id: @insured.insurance_id, pacient_id: @insured.pacient_id }
    assert_redirected_to insured_path(assigns(:insured))
  end

  test "should destroy insured" do
    assert_difference('Insured.count', -1) do
      delete :destroy, id: @insured
    end

    assert_redirected_to insureds_path
  end
end
