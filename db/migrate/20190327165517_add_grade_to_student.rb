class AddGradeToStudent < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :grade_id, :integer
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
