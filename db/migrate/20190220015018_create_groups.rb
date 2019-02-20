# frozen_string_literal: true

class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :address
      t.bigint :user_id

      t.timestamps
    end

    add_index :groups, :user_id
    add_index :groups, :name, unique: true
  end
end
