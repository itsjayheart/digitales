require 'test_helper'

class MicroserviceRequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get microservice_requests_create_url
    assert_response :success
  end

  test "should get update" do
    get microservice_requests_update_url
    assert_response :success
  end

end
