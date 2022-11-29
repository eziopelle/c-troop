require "test_helper"

class MarketProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get market_products_update_url
    assert_response :success
  end

  test "should get edit" do
    get market_products_edit_url
    assert_response :success
  end
end
