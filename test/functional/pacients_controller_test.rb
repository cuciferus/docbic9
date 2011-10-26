require 'test_helper'

class PacientsControllerTest < ActionController::TestCase
  setup do
    @pacient = pacients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pacients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pacient" do
    assert_difference('Pacient.count') do
      post :create, pacient: @pacient.attributes
    end

    assert_redirected_to pacient_path(assigns(:pacient))
  end

  test "should show pacient" do
    get :show, id: @pacient.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pacient.to_param
    assert_response :success
  end

  test "should update pacient" do
    put :update, id: @pacient.to_param, pacient: @pacient.attributes
    assert_redirected_to pacient_path(assigns(:pacient))
  end

  test "should destroy pacient" do
    assert_difference('Pacient.count', -1) do
      delete :destroy, id: @pacient.to_param
    end

    assert_redirected_to pacients_path
  end
end
