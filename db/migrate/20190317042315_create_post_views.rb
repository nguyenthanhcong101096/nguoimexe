# frozen_string_literal: true

class CreatePostViews < ActiveRecord::Migration[5.0]
  def change
    create_table :post_views do |t|
      t.integer :post_id, null: false
      t.inet :ip_address, null: false

      t.timestamps
    end

    add_index :post_views, :post_id
    add_index :post_views, %i[post_id ip_address]
  end
end
