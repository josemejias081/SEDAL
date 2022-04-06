class AddReferencesItemsToLikertScales < ActiveRecord::Migration[6.0]
  def change
    add_reference :items, :likert_scales, null: false, foreign_key: true
  end
end
