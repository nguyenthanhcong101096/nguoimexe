# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :context, limit: 500, null: false
      t.integer :commentable_id
      t.string :commentable_type
      t.bigint :user_id

      t.timestamps
    end
  end
end
