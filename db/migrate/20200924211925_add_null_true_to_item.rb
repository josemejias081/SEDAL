class AddNullTrueToItem < ActiveRecord::Migration[6.0]
  def change
    change_column :items, :scale_id, :integer, :null => true
  end
end
