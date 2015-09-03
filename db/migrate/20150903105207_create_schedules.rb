class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :title
      t.datetime :start_at
      t.integer :channel_id

      t.timestamps null: false
    end
  end
end
