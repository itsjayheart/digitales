require 'test_helper'

class DigitalesDotGgControllerTest < ActionDispatch::IntegrationTest
  test "should get static_index" do
    get digitales_dot_gg_static_index_url
    assert_response :success
  end

end
