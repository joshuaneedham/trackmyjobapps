json.extract! job, :id, :company, :job_title, :job_board_link, :job_description, :job_position_type, :job_pay_type, :job_application_status, :created_at, :updated_at
json.url job_url(job, format: :json)
json.job_description job.job_description.to_s
