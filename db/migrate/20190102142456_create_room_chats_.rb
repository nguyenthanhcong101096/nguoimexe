# frozen_string_literal: true

class CreateRoomChats < ActiveRecord::Migration[5.0]
  def change
    create_table :room_chats do |t|
      t.bigint :conversation_id, null: false
      t.bigint :sender_id, null: false

      t.timestamps
    end

    add_index :room_chats, :sender_id
    add_index :room_chats, :conversation_id

    add_index :room_chats, %i[sender_id conversation_id], unique: true
  end
end
