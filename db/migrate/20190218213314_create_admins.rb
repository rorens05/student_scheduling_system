class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
      t.string :name
      t.string :username
      t.string :email

      t.timestamps
    end
  end
end
