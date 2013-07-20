class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :name
      t.text :symptoms
      t.string :phone
      t.date :dob
      t.text :notes

      t.timestamps
    end
  end
end
