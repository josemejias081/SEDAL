class AddColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :disability, :string
  end
end
