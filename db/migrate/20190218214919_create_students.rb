class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name
      t.string :student_no
      t.date :birthday
      t.string :address
      t.string :contact_no
      t.string :email
      t.date :date_enrolled

      t.timestamps
    end
  end
end
