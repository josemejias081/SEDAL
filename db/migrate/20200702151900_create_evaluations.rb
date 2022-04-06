class CreateEvaluations < ActiveRecord::Migration[6.0]
  def change
    create_table :evaluations do |t|
      t.string :title
      t.text :description
      t.date :pub_date
      t.references :user, null: false, foreign_key: true
    end
  end
end
