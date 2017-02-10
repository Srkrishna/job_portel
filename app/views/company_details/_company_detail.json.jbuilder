json.extract! company_detail, :id, :name, :address, :keyword, :description, :url, :created_at, :updated_at
json.url company_detail_url(company_detail, format: :json)