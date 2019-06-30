class CreatePostContents < ActiveRecord::Migration[5.2]
  def change
    create_table :post_contents do |t|
      t.integer :post_id
      t.string :image_name

      t.timestamps
    end
  end
end
