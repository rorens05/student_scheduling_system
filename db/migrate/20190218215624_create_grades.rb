class CreateGrades < ActiveRecord::Migration[5.2]
  def change
    create_table :grades do |t|
      t.string :grade
      t.string :description

      t.timestamps
    end
  end
end
