class AddSurname < ActiveRecord::Migration
  def up
  	add_column :patients, :surname, :string
    rename_column :patients, :name, :first_name
  end

  def down
  end
end
