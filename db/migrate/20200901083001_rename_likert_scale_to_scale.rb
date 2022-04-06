class RenameLikertScaleToScale < ActiveRecord::Migration[6.0]
  def change
    rename_table :likert_scales, :scales
  end
end
