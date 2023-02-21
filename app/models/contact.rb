class Contact < ApplicationRecord
  belongs_to :user
  has_many :interviews
  has_many :job_contacts, dependent: :nullify
  has_many :jobs, through: :job_contacts, dependent: :nullify
  has_many :interview_contacts, dependent: :nullify
  has_many :interviews, through: :interview_contacts, dependent: :nullify

  enum contact_type: %i[interviewer recruiter other]

  def formatted_contact_type
    contact_type.to_s.titleize.tr("-", " ")
  end
end
