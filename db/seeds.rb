class Seeds
  def self.create
    Region.create(place: "Denver")
    Region.create(place: "Boston")
    Region.create(place: "San Francisco")

    Company.create(name: "QuickLeft")
    Company.create(name: "Thoughtbot")
    Company.create(name: "Pivotal Labs")

    CompanyRegion.create(company_id: 1, region_id: 1)
    CompanyRegion.create(company_id: 2, region_id: 2)
    CompanyRegion.create(company_id: 3, region_id: 3)

    Job.create(title: "Web Developer", job_description: "Build stuff", company_id: 1)
    Job.create(title: "Web Developer", job_description: "Build stuff", company_id: 2)
    Job.create(title: "Web Developer", job_description: "Build stuff", company_id: 3)
  end
end

Seeds.create
