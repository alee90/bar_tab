class AddTotalAmt < ActiveRecord::Migration
  def change
  	add_column :bars, :total, :decimal, :precision => 8, :scale => 2
  end
end
