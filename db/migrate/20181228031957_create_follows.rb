# frozen_string_literal: true

class CreateFollows < ActiveRecord::Migration[5.0]
  def change
    create_table :follows do |t|
      t.bigint :user_id, null: false
      t.bigint :target_user_id, null: false

      t.timestamps
    end

    add_index :follows, :user_id
    add_index :follows, :target_user_id
    add_index :follows, %i[user_id target_user_id], unique: true
  end
end
