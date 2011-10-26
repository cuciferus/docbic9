require 'test_helper'

class MedicamentesControllerTest < ActionController::TestCase
  setup do
    @medicamente = medicamentes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medicamentes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medicamente" do
    assert_difference('Medicamente.count') do
      post :create, medicamente: @medicamente.attributes
    end

    assert_redirected_to medicamente_path(assigns(:medicamente))
  end

  test "should show medicamente" do
    get :show, id: @medicamente.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medicamente.to_param
    assert_response :success
  end

  test "should update medicamente" do
    put :update, id: @medicamente.to_param, medicamente: @medicamente.attributes
    assert_redirected_to medicamente_path(assigns(:medicamente))
  end

  test "should destroy medicamente" do
    assert_difference('Medicamente.count', -1) do
      delete :destroy, id: @medicamente.to_param
    end

    assert_redirected_to medicamentes_path
  end
end
