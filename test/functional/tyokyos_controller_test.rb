require 'test_helper'

class TyokyosControllerTest < ActionController::TestCase
  setup do
    @tyokyo = tyokyos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tyokyos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tyokyo" do
    assert_difference('Tyokyo.count') do
      post :create, :tyokyo => { :after => @tyokyo.after, :before => @tyokyo.before }
    end

    assert_redirected_to tyokyo_path(assigns(:tyokyo))
  end

  test "should show tyokyo" do
    get :show, :id => @tyokyo
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @tyokyo
    assert_response :success
  end

  test "should update tyokyo" do
    put :update, :id => @tyokyo, :tyokyo => { :after => @tyokyo.after, :before => @tyokyo.before }
    assert_redirected_to tyokyo_path(assigns(:tyokyo))
  end

  test "should destroy tyokyo" do
    assert_difference('Tyokyo.count', -1) do
      delete :destroy, :id => @tyokyo
    end

    assert_redirected_to tyokyos_path
  end
end
