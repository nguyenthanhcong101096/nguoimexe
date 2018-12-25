class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.bigint :user_id, null: false
      t.bigint :target_user_id, null: false
      t.string :kind
      t.string :message
      t.string :url
      t.boolean :read, default: false
      t.timestamps
    end
  end
end
