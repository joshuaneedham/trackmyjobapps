class Job < ApplicationRecord
  belongs_to :user
  has_many :interviews
  has_many :job_contacts
  has_many :contacts, through: :job_contacts
  enum job_position_type: %i[full_time part_time contract contract_to_hire internship volunteer
    other]
  enum job_pay_type: %i[hourly salary]
  enum job_application_status: %i[submitted interview withdrawn offer_received rejected hired]

  def formatted_job_position_type
    job_position_type.to_s.titleize.tr("-", " ")
  end

  def formatted_job_application_status
    job_application_status.to_s.titleize.tr("-", " ")
  end

  has_rich_text :job_description
end
