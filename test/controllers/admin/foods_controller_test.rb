require "test_helper"

class Admin::FoodsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_foods_new_url
    assert_response :success
  end

  test "should get indexshow" do
    get admin_foods_indexshow_url
    assert_response :success
  end

  test "should get edit" do
    get admin_foods_edit_url
    assert_response :success
  end
end
