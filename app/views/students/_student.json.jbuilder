json.extract! student, :id, :name, :student_no, :birthday, :address, :contact_no, :email, :date_enrolled, :created_at, :updated_at
json.url student_url(student, format: :json)
