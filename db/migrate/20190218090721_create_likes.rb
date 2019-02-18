# frozen_string_literal: true

class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.bigint :user_id
      t.integer :likeable_id
      t.string :likeable_type

      t.timestamps
    end

    add_index :likes, :user_id
    add_index :likes, %i[user_id likeable_id likeable_type], unique: true
  end
end
