# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :describe
      t.bigint :user_id, null: false
      t.bigint :vehicle_kind_id, null: false
      t.string :status, null: false, default: 'spending'
      t.text :featured_image_data
      t.string :product_date, default: 'Unknown'
      t.string :brand, null: false, default: 'Unknown'
      t.float :registration, null: false, default: false
      t.float :price, null: false, default: 0.0
      t.string :slug_title

      t.timestamps
    end

    add_index :posts, :user_id
    add_index :posts, :vehicle_kind_id
  end
end
