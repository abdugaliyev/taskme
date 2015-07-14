require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get help" do
    get :help
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

  test "should get howitworks" do
    get :howitworks
    assert_response :success
  end

  test "should get create_task" do
    get :create_task
    assert_response :success
  end

  test "should get alltasks" do
    get :alltasks
    assert_response :success
  end

  test "should get alltaskers" do
    get :alltaskers
    assert_response :success
  end

  test "should get mytasks" do
    get :mytasks
    assert_response :success
  end

end
