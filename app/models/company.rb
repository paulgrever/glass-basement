class Company < ActiveRecord::Base
  has_many :jobs
  has_many :company_regions
  has_many :regions, through: :company_regions
  validates :name, uniqueness: true
end
