# frozen_string_literal: true

class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :msg
      t.text :attachment_data
      t.bigint :conversation_id, null: false
      t.bigint :sender_id, null: false
      t.boolean :read, default: false
      t.timestamps
    end

    add_index :messages, :sender_id
    add_index :messages, :conversation_id
  end
end
