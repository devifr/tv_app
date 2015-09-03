class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.integer :program_id
      t.integer :season
      t.integer :episode
      t.string :media_id
      t.integer :count

      t.timestamps null: false
    end
    add_attachment :videos, :thumbnail
  end
end
