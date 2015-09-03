class CreateLives < ActiveRecord::Migration
  def change
    create_table :lives do |t|
      t.integer :channel_id
      t.string :streaming_url

      t.timestamps null: false
    end
  end
end
