json.extract! instructor, :id, :name, :instructor_id, :birthday, :address, :contact_no, :email, :date_enrolled, :created_at, :updated_at
json.url instructor_url(instructor, format: :json)
