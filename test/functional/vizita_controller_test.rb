require 'test_helper'

class VizitaControllerTest < ActionController::TestCase
  setup do
    @vizitum = vizita(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vizita)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vizitum" do
    assert_difference('Vizitum.count') do
      post :create, vizitum: @vizitum.attributes
    end

    assert_redirected_to vizitum_path(assigns(:vizitum))
  end

  test "should show vizitum" do
    get :show, id: @vizitum.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vizitum.to_param
    assert_response :success
  end

  test "should update vizitum" do
    put :update, id: @vizitum.to_param, vizitum: @vizitum.attributes
    assert_redirected_to vizitum_path(assigns(:vizitum))
  end

  test "should destroy vizitum" do
    assert_difference('Vizitum.count', -1) do
      delete :destroy, id: @vizitum.to_param
    end

    assert_redirected_to vizita_path
  end
end
