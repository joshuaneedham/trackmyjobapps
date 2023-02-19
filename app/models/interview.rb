class Interview < ApplicationRecord
  enum interview_type: %i[phone in_person video]
  belongs_to :job
  belongs_to :contact
  belongs_to :user
end
