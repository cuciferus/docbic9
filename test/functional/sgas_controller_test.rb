require 'test_helper'

class SgasControllerTest < ActionController::TestCase
  setup do
    @sga = sgas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sgas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sga" do
    assert_difference('Sga.count') do
      post :create, sga: @sga.attributes
    end

    assert_redirected_to sga_path(assigns(:sga))
  end

  test "should show sga" do
    get :show, id: @sga.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sga.to_param
    assert_response :success
  end

  test "should update sga" do
    put :update, id: @sga.to_param, sga: @sga.attributes
    assert_redirected_to sga_path(assigns(:sga))
  end

  test "should destroy sga" do
    assert_difference('Sga.count', -1) do
      delete :destroy, id: @sga.to_param
    end

    assert_redirected_to sgas_path
  end
end
