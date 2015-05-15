require_relative '../config'

class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.decimal :price, precision: 8, scale: 2
      t.string :link
      t.belongs_to :vendor
      t.belongs_to :wish

      t.timestamps
    end
  end
end
