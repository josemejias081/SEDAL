class RemoveUserFromEvaluations < ActiveRecord::Migration[6.0]
  def change
    remove_reference :evaluations, :user, null: false, foreign_key: true
  end
end
