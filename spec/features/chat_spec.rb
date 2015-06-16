require "rails_helper"

RSpec.describe "Chat", type: :feature do
  before(:each) do
    @region1 = Region.create(place: "Wisconsin")
    @company1= Company.create(name: "Econify")
    @job1 = Job.create(title: "Job1", job_description: "description1")
    @region1.companies << @company1
    @company1.jobs << @job1
  end

  it "can chat" do
        
  end
end