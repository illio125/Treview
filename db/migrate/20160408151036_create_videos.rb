class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :vid
      t.string :media_url
      t.string :cover_url
      t.integer :duration
      t.references :user, index: true, foreign_key: true
      t.references :travel, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :videos, :title
    add_index :videos, :vid
  end
end
