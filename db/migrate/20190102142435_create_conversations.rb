# frozen_string_literal: true

class CreateConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :conversations do |t|
      t.string :name, null: false
      t.boolean :check, default: false

      t.timestamps
    end

    add_index :conversations, %i[name], unique: true
  end
end
