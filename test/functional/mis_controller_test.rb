require 'test_helper'

class MisControllerTest < ActionController::TestCase
  setup do
    @mi = mis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mi" do
    assert_difference('Mi.count') do
      post :create, mi: @mi.attributes
    end

    assert_redirected_to mi_path(assigns(:mi))
  end

  test "should show mi" do
    get :show, id: @mi.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mi.to_param
    assert_response :success
  end

  test "should update mi" do
    put :update, id: @mi.to_param, mi: @mi.attributes
    assert_redirected_to mi_path(assigns(:mi))
  end

  test "should destroy mi" do
    assert_difference('Mi.count', -1) do
      delete :destroy, id: @mi.to_param
    end

    assert_redirected_to mis_path
  end
end
