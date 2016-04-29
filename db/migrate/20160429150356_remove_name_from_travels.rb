class RemoveNameFromTravels < ActiveRecord::Migration
  def change
    remove_index :travels, column: [:name]
    remove_column :travels, :name, :string
  end
end
