class AddManagerToEmployees < ActiveRecord::Migration[7.1]
  def change
    add_reference :employees, :manager, null: true, foreign_key: { to_table: :employees }
  end
end
