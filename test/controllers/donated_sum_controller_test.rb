require 'test_helper'

class DonatedSumControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get donated_sum_create_url
    assert_response :success
  end

end
