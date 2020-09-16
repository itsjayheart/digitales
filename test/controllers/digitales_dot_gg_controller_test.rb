require 'test_helper'

class DigitalesDotGgControllerTest < ActionDispatch::IntegrationTest
  test "should get the_pool" do
    get digitales_dot_gg_the_pool_url
    assert_response :success
  end

  test "should get the_hook" do
    get digitales_dot_gg_the_hook_url
    assert_response :success
  end

  test "should get the_diver" do
    get digitales_dot_gg_the_diver_url
    assert_response :success
  end

end
