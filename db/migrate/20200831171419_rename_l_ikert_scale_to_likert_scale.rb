class RenameLIkertScaleToLikertScale < ActiveRecord::Migration[6.0]
  def change
    rename_table :l_ikert_scales, :likert_scales
  end
end
