require "test_helper"

class PracticingStatesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get practicing_states_index_url
    assert_response :success
  end
end
