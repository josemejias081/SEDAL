class RemoveColumnToEvaluations < ActiveRecord::Migration[6.0]
  def change
    remove_column :evaluations, :pub_date, :date
  end
end
