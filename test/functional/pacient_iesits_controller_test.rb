require 'test_helper'

class PacientIesitsControllerTest < ActionController::TestCase
  setup do
    @pacient_iesit = pacient_iesits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pacient_iesits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pacient_iesit" do
    assert_difference('PacientIesit.count') do
      post :create, pacient_iesit: @pacient_iesit.attributes
    end

    assert_redirected_to pacient_iesit_path(assigns(:pacient_iesit))
  end

  test "should show pacient_iesit" do
    get :show, id: @pacient_iesit.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pacient_iesit.to_param
    assert_response :success
  end

  test "should update pacient_iesit" do
    put :update, id: @pacient_iesit.to_param, pacient_iesit: @pacient_iesit.attributes
    assert_redirected_to pacient_iesit_path(assigns(:pacient_iesit))
  end

  test "should destroy pacient_iesit" do
    assert_difference('PacientIesit.count', -1) do
      delete :destroy, id: @pacient_iesit.to_param
    end

    assert_redirected_to pacient_iesits_path
  end
end
