json.extract! requested_job, :id, :emp_id, :job_id, :created_at, :updated_at
json.url requested_job_url(requested_job, format: :json)