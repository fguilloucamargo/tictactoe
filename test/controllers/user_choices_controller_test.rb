require 'test_helper'

class UserChoicesControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get user_choices_update_url
    assert_response :success
  end

end
