require "test_helper"

class AdvocatesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get advocates_index_url
    assert_response :success
  end

  test "should get assitants" do
    get advocates_assitants_url
    assert_response :success
  end
end
