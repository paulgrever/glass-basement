require 'rails_helper'

RSpec.describe Job, type: :model do
  before(:each) do
    @company = Company.create(name: "Company 1")
    @job = Job.create(title: "Title 1",
                      job_description: "Description",
                      company_id: @company.id)
  end

  it "can create a job" do
    expect(@job.title).to eq("Title 1")
    expect(@job.job_description).to eq("Description")
  end

  it "must have a title" do
    job = Job.new(job_description: "test")
    expect(job).to_not be_valid
  end

  it "must have a job_description" do
    job = Job.new(title: "test")
    expect(job).to_not be_valid
  end

  it "associated with a company" do
    expect(@job.company.name).to eq("Company 1")
  end
end
