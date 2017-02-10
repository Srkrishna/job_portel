json.extract! job_post, :id, :company_id, :required_on, :etc, :description, :created_at, :updated_at
json.url job_post_url(job_post, format: :json)