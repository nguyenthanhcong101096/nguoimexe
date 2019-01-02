class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :msg
      t.bigint :conversation_id
      t.bigint :user_id
      
      t.timestamps
    end
    
    add_index :messages, :user_id
    add_index :messages, :conversation_id
  end
end
