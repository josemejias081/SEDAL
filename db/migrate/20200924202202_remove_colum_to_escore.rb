class RemoveColumToEscore < ActiveRecord::Migration[6.0]
  def change
    add_column :scores, :description, :string
  end
end
