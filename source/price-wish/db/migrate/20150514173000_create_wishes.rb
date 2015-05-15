require_relative '../config'

class CreateWishes < ActiveRecord::Migration
  def change
    create_table :wishes do |t|
      t.decimal :price
      t.string :state, null: false
      t.belongs_to :user
      t.belongs_to :product

      t.timestamps
    end
  end
end
