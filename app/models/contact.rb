class Contact < ApplicationRecord
  belongs_to :user
  has_many :interviews
  has_many :job_contacts
  has_many :jobs, through: :job_contacts
end
