class Job < ActiveRecord::Base
  belongs_to :company
  has_many :chats
  validates :title, :job_description, presence: true
end
