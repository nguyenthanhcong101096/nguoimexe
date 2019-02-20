# frozen_string_literal: true

class CreateBlogs < ActiveRecord::Migration[5.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :content
      t.text :img_data
      t.bigint :user_id
      t.string :kind, default: 'newfeed'
      t.string :mod, default: 'public'

      t.string :slug_title

      t.timestamps
    end
  end
end
