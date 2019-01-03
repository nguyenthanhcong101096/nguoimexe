class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :msg
      t.bigint :conversation_id, null: false
      t.bigint :user_id, null: false
      t.boolean :read, default: false
      
      t.timestamps
    end
    
    add_index :messages, :user_id
    add_index :messages, :conversation_id
  end
end
