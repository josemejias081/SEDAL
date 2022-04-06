class CreateExams < ActiveRecord::Migration[6.0]
  def change
    create_table :exams do |t|
      t.references :item, null: false, foreign_key: true
      t.references :test, null: false, foreign_key: true
      t.float :average
    end
  end
end
