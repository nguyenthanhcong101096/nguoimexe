# frozen_string_literal: true

class CreateUserChats < ActiveRecord::Migration[5.0]
  def change
    create_table :user_chats do |t|
      t.bigint :conversation_id, null: false
      t.bigint :sender_id, null: false

      t.timestamps
    end

    add_index :user_chats, :sender_id
    add_index :user_chats, :conversation_id

    add_index :user_chats, %i[sender_id conversation_id], unique: true
  end
end
