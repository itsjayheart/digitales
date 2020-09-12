require 'test_helper'

class FundraiserControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get fundraiser_create_url
    assert_response :success
  end

  test "should get new" do
    get fundraiser_new_url
    assert_response :success
  end

end
