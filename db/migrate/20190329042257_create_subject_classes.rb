class CreateSubjectClasses < ActiveRecord::Migration[5.2]
  def change
    create_table :subject_classes do |t|
      t.string :schedule
      t.string :subject
      t.string :day
      t.integer :minutes_per_week
      t.string :subject_teacher
      t.references :section, foreign_key: true

      t.timestamps
    end
  end
end
