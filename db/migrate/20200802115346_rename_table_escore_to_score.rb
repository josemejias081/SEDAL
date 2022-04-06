class RenameTableEscoreToScore < ActiveRecord::Migration[6.0]
  def change
    rename_table :escores, :scores
  end
end
