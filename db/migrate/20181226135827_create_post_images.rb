class CreatePostImages < ActiveRecord::Migration[5.0]
  def change
    create_table :post_images do |t|
      t.bigint :post_id
      t.timestamps
    end
  end
end
