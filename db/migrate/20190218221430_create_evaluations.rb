class CreateEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations do |t|
      t.references :grade, foreign_key: true
      t.references :curriculum, foreign_key: true
      t.string :school_year

      t.timestamps
    end
  end
end
