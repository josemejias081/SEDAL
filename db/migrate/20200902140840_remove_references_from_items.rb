class RemoveReferencesFromItems < ActiveRecord::Migration[6.0]
  def change
    remove_reference :items, :likert_scale
  end
end
