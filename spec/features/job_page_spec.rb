require "rails_helper"


RSpec.describe "User", type: :feature do
  context "on the jobs index page" do
    before(:each ) do
      @region1 = Region.create(place: "Wisconsin")
      Region.create(place: "Remote")
      Region.create(place: "Colorado")
      @company1= Company.create(name: "Econify")
      Company.create(name: "LivingSocial")
      @job1 = Job.create(title: "Job1", job_description: "description1")
    end

    it "displays the region on the page" do
      visit root_path
      expect(page).to have_content("Wisconsin")
    end

    it "can view the businesses in the region", js: true  do
      @region1.companies << @company1
      visit root_path
      first(".collapsible-header").click
      expect(page).to have_content("Econify")
    end

    it "can view the company info", js: true do
      @region1.companies << @company1
      @company1.jobs << @job1
      visit root_path
      first(".collapsible-header").click
      click_link_or_button("Job1")
      expect(page).to have_content("Econify")
      expect(page).to have_content("Job1")
      expect(current_path).to eq(job_path(@job1))
    end
  end
end
