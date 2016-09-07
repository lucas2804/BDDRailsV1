require 'test_helper'

class Admin::TestsControllerTest < ActionController::TestCase
  setup do
    @admin_test = admin_tests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_tests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_test" do
    assert_difference('Admin::Test.count') do
      post :create, admin_test: {  }
    end

    assert_redirected_to admin_test_path(assigns(:admin_test))
  end

  test "should show admin_test" do
    get :show, id: @admin_test
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_test
    assert_response :success
  end

  test "should update admin_test" do
    patch :update, id: @admin_test, admin_test: {  }
    assert_redirected_to admin_test_path(assigns(:admin_test))
  end

  test "should destroy admin_test" do
    assert_difference('Admin::Test.count', -1) do
      delete :destroy, id: @admin_test
    end

    assert_redirected_to admin_tests_path
  end
end
