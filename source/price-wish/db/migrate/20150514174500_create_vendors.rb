require_relative '../config'

class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :api_link

      t.timestamps
    end
  end
end
