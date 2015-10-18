class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.references :employee
      t.references :vacancy
      t.string :name
      t.index :name, unique: true
      t.timestamps null: false
    end
  end
end
