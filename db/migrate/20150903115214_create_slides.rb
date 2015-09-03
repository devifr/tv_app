class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.integer :imageable_id
      t.string :imageable_type
      t.integer :count

      t.timestamps null: false
    end
  end
end
