require 'test_helper'

class ParaclinicesControllerTest < ActionController::TestCase
  setup do
    @paraclinice = paraclinices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:paraclinices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create paraclinice" do
    assert_difference('Paraclinice.count') do
      post :create, paraclinice: @paraclinice.attributes
    end

    assert_redirected_to paraclinice_path(assigns(:paraclinice))
  end

  test "should show paraclinice" do
    get :show, id: @paraclinice.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @paraclinice.to_param
    assert_response :success
  end

  test "should update paraclinice" do
    put :update, id: @paraclinice.to_param, paraclinice: @paraclinice.attributes
    assert_redirected_to paraclinice_path(assigns(:paraclinice))
  end

  test "should destroy paraclinice" do
    assert_difference('Paraclinice.count', -1) do
      delete :destroy, id: @paraclinice.to_param
    end

    assert_redirected_to paraclinices_path
  end
end
