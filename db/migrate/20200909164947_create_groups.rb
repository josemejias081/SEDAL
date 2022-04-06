class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :section
      t.string :responsible

      t.timestamps
    end
  end
end
