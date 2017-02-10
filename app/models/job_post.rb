class JobPost < ApplicationRecord
  #belongs_to :company_detail
  has_many :requested_job
end
