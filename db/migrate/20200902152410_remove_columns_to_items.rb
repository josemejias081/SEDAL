class RemoveColumnsToItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :likert_scales_id, :integer
    remove_column :items, :likert_scale, :integer
    remove_column :items, :likert_scales_id, :index
  end
end
