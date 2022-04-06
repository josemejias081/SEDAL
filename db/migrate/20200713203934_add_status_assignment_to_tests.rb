class AddStatusAssignmentToTests < ActiveRecord::Migration[6.0]
  def change
    add_reference :tests, :evaluation, null: false, foreign_key: true
    add_column :tests, :evaluator_id, :integer
    add_column :tests, :evaluated_id, :integer
  end
end
