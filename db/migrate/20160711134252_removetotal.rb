class Removetotal < ActiveRecord::Migration
  def change
  	remove_column :bars, :total, :decimal
  	remove_column :entries, :entry, :decimal
  	add_column :entries, :entry, :decimal, precision: 6, scale: 2
  	add_reference :entries, :bars, index: true
  end
end
