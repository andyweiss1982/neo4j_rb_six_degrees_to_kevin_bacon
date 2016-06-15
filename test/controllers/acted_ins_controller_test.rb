require 'test_helper'

class ActedInsControllerTest < ActionController::TestCase
  setup do
    @acted_in = acted_ins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:acted_ins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create acted_in" do
    assert_difference('ActedIn.count') do
      post :create, acted_in: { role: @acted_in.role }
    end

    assert_redirected_to acted_in_path(assigns(:acted_in))
  end

  test "should show acted_in" do
    get :show, id: @acted_in
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @acted_in
    assert_response :success
  end

  test "should update acted_in" do
    patch :update, id: @acted_in, acted_in: { role: @acted_in.role }
    assert_redirected_to acted_in_path(assigns(:acted_in))
  end

  test "should destroy acted_in" do
    assert_difference('ActedIn.count', -1) do
      delete :destroy, id: @acted_in
    end

    assert_redirected_to acted_ins_path
  end
end
