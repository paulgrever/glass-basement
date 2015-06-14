class Job < ActiveRecord::Base
  validates :title, :job_description, presence: true
end
