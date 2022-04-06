class AddUserIdToEvaluations < ActiveRecord::Migration[6.0]
  def change
    add_column :evaluations, :user_id, :integer, foreign_key: true
  end
end
