# == Schema Information
#
# Table name: addresses
#
#  id         :integer          not null, primary key
#  street     :string
#  country    :string
#  city       :string
#  state      :string
#  zip_code   :integer
#  latitude   :float
#  longitude  :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Address < ApplicationRecord
  geocoded_by :full_address
  before_save :geocode
  validates :user, :street, :city, :state, :zip_code, presence: true

  def full_address
    [street, city, state, zip_code].compact.join(', ')
  end
end
