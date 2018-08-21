require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'user first name and last name have to be present' do
    user = User.new(email: "my@email.com", password: "password")
    user.validate

    refute_empty user.errors[:first_name]
    refute_empty user.errors[:last_name]
  end
end
