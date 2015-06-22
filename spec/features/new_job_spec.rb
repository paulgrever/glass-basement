require "rails_helper"

RSpec.describe "Create Job", type: :feature do
  context "posting a chat", js: true do
    before(:each) do
      @region1 = Region.create(place: "Wisconsin")
      @company1 = Company.create(name: "Econify")
      @job1 = Job.create(title: "Job1", job_description: "description1")
      @region1.companies << @company1
      @company1.jobs << @job1
    end

    it "it can create a new interview"do
      github_login
      visit job_path(@job1)
      click_link_or_button(" Add an Interview")
      fill_in("interview_form[title]", with: "Interview 1")
      
    end
  end
end