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
      visit root_path
      # find(".button-collapse").click
      click_link_or_button("Login")
      visit job_path(@job1)

      click_link_or_button("Add an Interview")
      find("#date-pick").click
      click_link_or_button("Today")
      # fill_in("interview_form[date]", with: "17 June, 2015")
      fill_in("interview_form[title]", with: "Interview 1")
      fill_in("interview_form[details]", with: "Details" )
      fill_in("interview_form[questions]", with: "Question 1" )
      fill_in("interview_form[interviewer_name]", with: "Name" )
      fill_in("interview_form[interviewer_email]", with: "Email@email.com" )
      fill_in("interview_form[interviewer_phone]", with: "555-555-5555" )
      within("#interview-form") do 
        click_link_or_button("Send")
      end
      expect(page).to have_content("Interview 1")
    end
  end
end