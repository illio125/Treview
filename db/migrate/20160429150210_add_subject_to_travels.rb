class AddSubjectToTravels < ActiveRecord::Migration
  def change
    add_column :travels, :subject, :string
    add_column :travels, :todo, :string
    add_column :travels, :place, :string
    add_column :travels, :preposition, :string, default: 'in'
  end
end
