class CompanyRegion < ActiveRecord::Base
  belongs_to :region
  belongs_to :company
end
