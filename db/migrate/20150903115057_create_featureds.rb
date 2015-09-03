class CreateFeatureds < ActiveRecord::Migration
  def change
    create_table :featureds do |t|
      t.integer :video_id

      t.timestamps null: false
    end
  end
end
