require_relative '../config'

class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   :name, null: false, limit: 50

      t.timestamps
    end
  end
end
