json.extract! member, :id, :name, :address1, :address2, :phone, :email, :photo, :role, :resume, :locations, :links, :description, :father_name, :created_at, :updated_at
json.url member_url(member, format: :json)