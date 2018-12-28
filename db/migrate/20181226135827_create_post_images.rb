# frozen_string_literal: true

class CreatePostImages < ActiveRecord::Migration[5.0]
  def change
    create_table :post_images do |t|
      t.bigint :post_id
      t.text :post_image_data

      t.timestamps
    end
  end
end
