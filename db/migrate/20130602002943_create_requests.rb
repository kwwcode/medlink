class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.date :date
      t.text :items
      t.integer :patient_id
      t.integer :user_id

      t.timestamps
    end
  end
end
