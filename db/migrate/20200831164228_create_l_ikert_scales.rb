class CreateLIkertScales < ActiveRecord::Migration[6.0]
  def change
    create_table :l_ikert_scales do |t|
      t.string :description
      t.references :answer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
