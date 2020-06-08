require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get learn" do
    get static_pages_learn_url
    assert_response :success
  end

  test "should get tactics" do
    get static_pages_tactics_url
    assert_response :success
  end

  test "should get historical" do
    get static_pages_historical_url
    assert_response :success
  end

end
