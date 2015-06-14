class Company < ActiveRecord::Base
  has_many :jobs
  validates :name, uniqueness: true
end
