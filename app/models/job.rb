class Job < ActiveRecord::Base
  belongs_to :company
  has_many :chats
  has_many :interviews
  validates :title, :job_description, presence: true
end
