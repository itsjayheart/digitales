require 'test_helper'

class CreatrixesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get creatrixes_show_url
    assert_response :success
  end

end
