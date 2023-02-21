class JobContact < ApplicationRecord
  belongs_to :job
  belongs_to :contact
end
