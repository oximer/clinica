require 'test_helper'

class ProceduretypesControllerTest < ActionController::TestCase
  setup do
    @proceduretype = proceduretypes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:proceduretypes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create proceduretype" do
    assert_difference('Proceduretype.count') do
      post :create, proceduretype: { followup: @proceduretype.followup, name: @proceduretype.name }
    end

    assert_redirected_to proceduretype_path(assigns(:proceduretype))
  end

  test "should show proceduretype" do
    get :show, id: @proceduretype
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @proceduretype
    assert_response :success
  end

  test "should update proceduretype" do
    patch :update, id: @proceduretype, proceduretype: { followup: @proceduretype.followup, name: @proceduretype.name }
    assert_redirected_to proceduretype_path(assigns(:proceduretype))
  end

  test "should destroy proceduretype" do
    assert_difference('Proceduretype.count', -1) do
      delete :destroy, id: @proceduretype
    end

    assert_redirected_to proceduretypes_path
  end
end
