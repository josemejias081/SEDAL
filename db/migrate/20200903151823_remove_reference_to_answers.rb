class RemoveReferenceToAnswers < ActiveRecord::Migration[6.0]
  def change
    remove_column :answers, :item_id, :index
    remove_column :answers, :item_id, :integer
  end
end
