class Interview < ActiveRecord::Base
  belongs_to :job
  belongs_to :user
  validates :job_id, :title, :user_id, presence: true
end
