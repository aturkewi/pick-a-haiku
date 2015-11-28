require 'test_helper'

class HaikusControllerTest < ActionController::TestCase
  setup do
    @haiku = haikus(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:haikus)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create haiku" do
    assert_difference('Haiku.count') do
      post :create, haiku: { compGen: @haiku.compGen, likes: @haiku.likes, line1: @haiku.line1, line2: @haiku.line2, line3: @haiku.line3 }
    end

    assert_redirected_to haiku_path(assigns(:haiku))
  end

  test "should show haiku" do
    get :show, id: @haiku
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @haiku
    assert_response :success
  end

  test "should update haiku" do
    patch :update, id: @haiku, haiku: { compGen: @haiku.compGen, likes: @haiku.likes, line1: @haiku.line1, line2: @haiku.line2, line3: @haiku.line3 }
    assert_redirected_to haiku_path(assigns(:haiku))
  end

  test "should destroy haiku" do
    assert_difference('Haiku.count', -1) do
      delete :destroy, id: @haiku
    end

    assert_redirected_to haikus_path
  end
end
