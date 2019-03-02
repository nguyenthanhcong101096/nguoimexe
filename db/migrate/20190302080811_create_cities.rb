# frozen_string_literal: true

class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|
      t.string :name
      t.bigint :provinces

      t.timestamps
    end

    add_index :cities, :provinces
  end
end
