json.extract! interview, :id, :title, :notes, :interview_date, :interview_type, :job_id, :contact_id, :user_id, :created_at, :updated_at
json.url interview_url(interview, format: :json)
