require 'test_helper'

class Sf36sControllerTest < ActionController::TestCase
  setup do
    @sf36 = sf36s(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sf36s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sf36" do
    assert_difference('Sf36.count') do
      post :create, sf36: @sf36.attributes
    end

    assert_redirected_to sf36_path(assigns(:sf36))
  end

  test "should show sf36" do
    get :show, id: @sf36.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sf36.to_param
    assert_response :success
  end

  test "should update sf36" do
    put :update, id: @sf36.to_param, sf36: @sf36.attributes
    assert_redirected_to sf36_path(assigns(:sf36))
  end

  test "should destroy sf36" do
    assert_difference('Sf36.count', -1) do
      delete :destroy, id: @sf36.to_param
    end

    assert_redirected_to sf36s_path
  end
end
