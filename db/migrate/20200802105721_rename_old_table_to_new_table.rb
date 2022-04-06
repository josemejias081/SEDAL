class RenameOldTableToNewTable < ActiveRecord::Migration[6.0]
  def change
    rename_table :exams, :escores
  end
end
