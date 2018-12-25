class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.string :url
      t.string :kind
      t.string :message
      t.bigint :user_id
      t.bigint :post_id
      t.boolean :read, null: false, default: false
      
      t.timestamps
    end
  end
end
