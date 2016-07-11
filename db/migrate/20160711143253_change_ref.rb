class ChangeRef < ActiveRecord::Migration
  def change
  	remove_reference :entries, :bars
  	 add_reference :entries, :bar, index: true
  end
end
