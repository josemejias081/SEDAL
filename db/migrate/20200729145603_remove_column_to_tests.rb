class RemoveColumnToTests < ActiveRecord::Migration[6.0]
  def change
    remove_column :tests, :title, :string
    remove_column :tests, :body, :text
  end
end
