class AddReferenceToItems < ActiveRecord::Migration[6.0]
  def change
    if Scale.all.count < 1
      scale = Scale.create(description: "default")
    else
      scale = Scale.first
    end
    add_reference :items, :scale, null: false, foreign_key: true, default: scale.id
  end
end
