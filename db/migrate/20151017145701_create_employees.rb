class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string  :name
      t.string  :contact
      t.integer :salary
      t.boolean :status
      t.timestamps null: false
    end
  end
end
