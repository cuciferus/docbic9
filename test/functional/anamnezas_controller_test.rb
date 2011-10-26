require 'test_helper'

class AnamnezasControllerTest < ActionController::TestCase
  setup do
    @anamneza = anamnezas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:anamnezas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create anamneza" do
    assert_difference('Anamneza.count') do
      post :create, anamneza: @anamneza.attributes
    end

    assert_redirected_to anamneza_path(assigns(:anamneza))
  end

  test "should show anamneza" do
    get :show, id: @anamneza.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @anamneza.to_param
    assert_response :success
  end

  test "should update anamneza" do
    put :update, id: @anamneza.to_param, anamneza: @anamneza.attributes
    assert_redirected_to anamneza_path(assigns(:anamneza))
  end

  test "should destroy anamneza" do
    assert_difference('Anamneza.count', -1) do
      delete :destroy, id: @anamneza.to_param
    end

    assert_redirected_to anamnezas_path
  end
end
