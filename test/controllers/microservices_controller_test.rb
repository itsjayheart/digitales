require 'test_helper'

class MicroservicesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get microservices_show_url
    assert_response :success
  end

end
