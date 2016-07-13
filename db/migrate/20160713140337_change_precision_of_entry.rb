class ChangePrecisionOfEntry < ActiveRecord::Migration
  def change
  	  	remove_column :entries, :entry, :decimal
  		add_column :entries, :entry, :decimal, precision: 10, scale: 2
  end
end
