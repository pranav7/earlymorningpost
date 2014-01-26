require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get technology" do
    get :technology
    assert_response :success
  end

  test "should get sports" do
    get :sports
    assert_response :success
  end

  test "should get world" do
    get :world
    assert_response :success
  end

  test "should get entertainment" do
    get :entertainment
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

end
