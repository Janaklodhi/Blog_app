class CreatePatients < ActiveRecord::Migration[7.1]
  def change
    create_table :patients do |t|
      t.string :name
      t.date :date_of_birth
      t.string :gender
      t.string :phone_number

      t.timestamps
    end
  end
end