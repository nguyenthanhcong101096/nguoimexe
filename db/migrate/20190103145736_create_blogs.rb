class CreateBlogs < ActiveRecord::Migration[5.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :content
      t.text :img_data
      t.bigint :user_id
      
      t.timestamps
    end
  end
end
