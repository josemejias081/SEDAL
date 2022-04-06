class RemoveNameToUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :age, :datetime
  end
end
