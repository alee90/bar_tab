class CreateTotals < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.decimal :entry
      t.timestamps null: false
    end
  end
end
