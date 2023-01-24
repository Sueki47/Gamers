class CreatePostReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :post_reviews do |t|
      t.integer :user_id
      t.integer :game_id
      t.string :review_title
      t.text :opinion
      t.float :rate
      t.string :review_image_id
      
      t.timestamps
    end
  end
end
