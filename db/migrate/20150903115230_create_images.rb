class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|

      t.timestamps null: false
    end
    add_attachment :images, :thumbnail
  end
end
