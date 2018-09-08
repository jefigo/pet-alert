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
  validates :city,
            :state,
            :street,
            :user_id,
            :zip_code,
            presence: true

  belongs_to :user

  def full_address
    [city, state, street, zip_code].compact.join(', ')
  end
end
