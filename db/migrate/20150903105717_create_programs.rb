class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string :code
      t.string :name
      t.integer :category_id
      t.integer :channel_id
      t.boolean :is_episode

      t.timestamps null: false
    end
    add_attachment :programs, :thumbnail
  end
end
