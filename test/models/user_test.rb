# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string
#  last_name              :string
#  phone_number           :string
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'user first name and last name have to be present' do
    user = User.new(email: "my@email.com", password: "password")
    user.validate

    refute_empty user.errors[:first_name]
    refute_empty user.errors[:last_name]
  end
end
