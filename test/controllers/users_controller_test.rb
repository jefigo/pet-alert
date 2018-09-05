require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers
  fixtures :all

  test "Get home" do
    @request.env['devise.mapping'] = Devise.mappings[:user]

    sign_in users(:john_doe)
    assert_response :success
  end
end

