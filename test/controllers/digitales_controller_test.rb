require 'test_helper'

class DigitalesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get digitales_show_url
    assert_response :success
  end

end
