# frozen_string_literal: true

class CreatePostImages < ActiveRecord::Migration[5.0]
  def change
    create_table :post_images do |t|
      t.integer :post_imageable_id
      t.string :post_imageable_type
      t.string :url, default: 'Unknow'
      t.string :public_id, unique: true

      t.timestamps
    end
  end
end
