class AddDataToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :picture, :string
    add_column :users, :name, :string
    add_column :users, :last_name, :string
    add_column :users, :num_identification, :integer
    add_column :users, :place_of_birth, :string
    add_column :users, :age, :datetime
    add_column :users, :address, :string
    add_column :users, :appointment, :string
        
  end
end
