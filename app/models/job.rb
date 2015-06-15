class Job < ActiveRecord::Base
  belongs_to :company
  validates :title, :job_description, presence: true
end
