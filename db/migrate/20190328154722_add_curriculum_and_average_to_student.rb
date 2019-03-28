class AddCurriculumAndAverageToStudent < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :average, :decimal
    add_column :students, :curriculum_id, :integer
  end
end
