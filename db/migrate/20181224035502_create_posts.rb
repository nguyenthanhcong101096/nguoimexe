# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :describe
      t.bigint :user_id, null: false
      t.bigint :vehicle_kind_id, null: false
      t.string :status, null: false, default: 'draft'
      t.text :featured_image_data
      t.string :car_life, default: 'Unknown'
      t.string :capacity, default: 'Unknown'
      t.string :range_of_vehicle, default: 'Unknown'
      t.string :status_of_vehicle, def: 'Unknown'
      t.float :price, null: false, default: 0.0
      t.string :year_of_registration, default: 'Unknown'
      t.string :km, default: 'Unknown'
      t.string :slug_title
      t.bigint :city_id
      t.string :color, default: 'Unknown'
      t.integer :views_count, null: false, default: 0

      t.timestamps
    end

    add_index :posts, :user_id
    add_index :posts, :vehicle_kind_id
  end
end
