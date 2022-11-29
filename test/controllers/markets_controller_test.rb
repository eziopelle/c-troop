require "test_helper"

class MarketsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get markets_index_url
    assert_response :success
  end
end
