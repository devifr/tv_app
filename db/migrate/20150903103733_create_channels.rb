class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string :code
      t.string :name
      t.text :description

      t.timestamps null: false
    end
    add_attachment :channels, :thumbnail
  end
end
