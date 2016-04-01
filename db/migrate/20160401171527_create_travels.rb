class CreateTravels < ActiveRecord::Migration
  def change
    create_table :travels do |t|
      t.string :name

      t.timestamps null: false
    end
    add_index :travels, :name
  end
end
