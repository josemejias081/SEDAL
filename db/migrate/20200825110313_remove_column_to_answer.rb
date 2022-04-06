class RemoveColumnToAnswer < ActiveRecord::Migration[6.0]
  def change
    remove_reference :answers, :test, null: false, foreign_key: true
  end
end
