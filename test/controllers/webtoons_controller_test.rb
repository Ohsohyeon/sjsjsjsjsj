require 'test_helper'

class WebtoonsControllerTest < ActionController::TestCase
  setup do
    @webtoon = webtoons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:webtoons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create webtoon" do
    assert_difference('Webtoon.count') do
      post :create, webtoon: { pre_day: @webtoon.pre_day, url: @webtoon.url }
    end

    assert_redirected_to webtoon_path(assigns(:webtoon))
  end

  test "should show webtoon" do
    get :show, id: @webtoon
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @webtoon
    assert_response :success
  end

  test "should update webtoon" do
    patch :update, id: @webtoon, webtoon: { pre_day: @webtoon.pre_day, url: @webtoon.url }
    assert_redirected_to webtoon_path(assigns(:webtoon))
  end

  test "should destroy webtoon" do
    assert_difference('Webtoon.count', -1) do
      delete :destroy, id: @webtoon
    end

    assert_redirected_to webtoons_path
  end
end
