require 'test_helper'

class IndicatedsControllerTest < ActionController::TestCase
  setup do
    @indicated = indicateds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:indicateds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create indicated" do
    assert_difference('Indicated.count') do
      post :create, indicated: { description: @indicated.description, indication_id: @indicated.indication_id }
    end

    assert_redirected_to indicated_path(assigns(:indicated))
  end

  test "should show indicated" do
    get :show, id: @indicated
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @indicated
    assert_response :success
  end

  test "should update indicated" do
    patch :update, id: @indicated, indicated: { description: @indicated.description, indication_id: @indicated.indication_id }
    assert_redirected_to indicated_path(assigns(:indicated))
  end

  test "should destroy indicated" do
    assert_difference('Indicated.count', -1) do
      delete :destroy, id: @indicated
    end

    assert_redirected_to indicateds_path
  end
end
