# frozen_string_literal: true

class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|
      t.string :name
      t.bigint :province_id

      t.timestamps
    end

    add_index :cities, :province_id
  end
end
