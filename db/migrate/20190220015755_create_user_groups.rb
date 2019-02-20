# frozen_string_literal: true

class CreateUserGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :user_groups do |t|
      t.bigint :user_id
      t.bigint :group_id
      t.string :role, default: 'member'

      t.timestamps
    end

    add_index :user_groups, :user_id
    add_index :user_groups, :group_id
    add_index :user_groups, %i[user_id group_id], unique: true
  end
end
