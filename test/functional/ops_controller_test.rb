require 'test_helper'

class OpsControllerTest < ActionController::TestCase
  setup do
    @op = ops(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ops)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create op" do
    assert_difference('Op.count') do
      post :create, op: @op.attributes
    end

    assert_redirected_to op_path(assigns(:op))
  end

  test "should show op" do
    get :show, id: @op.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @op.to_param
    assert_response :success
  end

  test "should update op" do
    put :update, id: @op.to_param, op: @op.attributes
    assert_redirected_to op_path(assigns(:op))
  end

  test "should destroy op" do
    assert_difference('Op.count', -1) do
      delete :destroy, id: @op.to_param
    end

    assert_redirected_to ops_path
  end
end
