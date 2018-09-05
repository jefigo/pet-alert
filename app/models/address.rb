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

  validates :street, :city, :state, :zip_code, presence: true

  belongs_to :user
  validates_presence_of :user

  def full_address
    [street, city, state, zip_code].compact.join(', ')
  end
end
