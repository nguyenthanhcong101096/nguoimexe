class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :context, limit: 500, null: false
      t.bigint :post_id
      t.bigint :user_id
      
      t.timestamps
    end
    
    add_index :comments, :user_id
    add_index :comments, :post_id
  end
end
