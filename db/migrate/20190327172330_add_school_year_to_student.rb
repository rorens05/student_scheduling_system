class AddSchoolYearToStudent < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :school_year, :string
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
