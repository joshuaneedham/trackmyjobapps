class Interview < ApplicationRecord
  belongs_to :job
  belongs_to :user
  has_many :interview_contacts, dependent: :nullify
  has_many :contacts, through: :interview_contacts, dependent: :nullify

  enum interview_type: %i[phone in_person video other]

  has_rich_text :notes
end
