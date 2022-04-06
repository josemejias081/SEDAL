class AddGroupIdToUser < ActiveRecord::Migration[6.0]
  def change
    if User.all.count < 1
      user = User.create(name: "jose", last_name: "mejias", num_identification: "1", place_of_birth: "bns",
          address: "monachil", appointment: "qwe", status: "as", phone_number: "3", disability: "as",
          email: "jo@gmail.com", password: "foobar", password_confirmation: "foobar",
          permission_level: 3, group_id: 1)
    else
      user = User.first
    end
    remove_column :groups, :responsible, :string
    add_column :groups, :responsible_id, :integer, null: false, foreign_key: true, default: user.id
  end
end
