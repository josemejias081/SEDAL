class RenameColumnAverageToValue < ActiveRecord::Migration[6.0]
  def change
    rename_column :escores, :average, :value
  end
end
