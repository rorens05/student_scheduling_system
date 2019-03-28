class CreateSections < ActiveRecord::Migration[5.2]
  def change
    create_table :sections do |t|
      t.string :name
      t.integer :school_year
      t.references :grade, foreign_key: true
      t.references :curriculum, foreign_key: true

      t.timestamps
    end
  end
end
