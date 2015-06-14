class Region < ActiveRecord::Base
  has_many :company_regions
  has_many :companies, through: :company_regions
  validates :place, uniqueness: true
end
