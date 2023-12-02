require "test_helper"

class Public::RanksControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_ranks_show_url
    assert_response :success
  end

  test "should get index" do
    get public_ranks_index_url
    assert_response :success
  end
end
