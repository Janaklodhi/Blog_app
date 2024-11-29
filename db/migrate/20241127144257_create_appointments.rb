class CreateAppointments < ActiveRecord::Migration[7.1]
  def change
    create_table :appointments do |t|
      t.date :datetime
      t.date :text
      t.string :status
      t.references :physician
      t.references :patient
      t.timestamps
    end
  end
end