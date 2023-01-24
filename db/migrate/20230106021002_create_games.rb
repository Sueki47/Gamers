class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :game_title
      t.text :about
      t.float :rate
      t.string :game_image_id
      t.integer :user_id
      t.string :youtube_url
      t.datetime :created_at
      t.datetime :updated_at
      t.timestamps
    end
  end
end
