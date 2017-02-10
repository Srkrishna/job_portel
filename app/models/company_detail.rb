class CompanyDetail < ApplicationRecord
  #belongs_to :member
  has_many :job_post
end
