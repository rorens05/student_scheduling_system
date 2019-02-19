class CreateInstructors < ActiveRecord::Migration[5.2]
  def change
    create_table :instructors do |t|
      t.string :name
      t.string :instructor_id
      t.date :birthday
      t.string :address
      t.string :contact_no
      t.string :email
      t.date :date_enrolled

      t.timestamps
    end
  end
end
