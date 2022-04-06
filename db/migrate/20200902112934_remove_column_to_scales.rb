class RemoveColumnToScales < ActiveRecord::Migration[6.0]
  def change
    remove_reference :scales, :answer, null: false, foreign_key: true
    add_reference :answers, :scale, null: false, foreign_key: true
  end
end
