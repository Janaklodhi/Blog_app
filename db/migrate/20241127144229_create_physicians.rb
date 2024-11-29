class CreatePhysicians < ActiveRecord::Migration[7.1]
  def change
    create_table :physicians do |t|
      t.string :name
      t.string :specialty 
      t.integer :years_of_experience 

      t.timestamps
    end
  end
end
