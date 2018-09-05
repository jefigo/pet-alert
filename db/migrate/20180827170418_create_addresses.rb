class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :zip_code
      t.string :street
      t.string :country
      t.string :city
      t.string :state
      t.float :latitude
      t.float :longitude
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
