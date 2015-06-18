require "rails_helper"

RSpec.describe "Create Job", type: :feature do
  context "posting a chat", js: true  do
    before(:each) do
      @region1 = Region.create(place: "Wisconsin")
      @company1= Company.create(name: "Econify")
      @job1 = Job.create(title: "Job1", job_description: "description1")
      @region1.companies << @company1
      @company1.jobs << @job1
    end

    it "can create a new job from root with new company and new region"do
      visit root_path
      within(".bottom") do
        click_link_or_button("Plus")
      end
      fill_in("job_form[title]", with: "New Job")
      fill_in("job_form[job_description]", with: "New Description")
      fill_in("job_form[new_company]", with: "New Company")
      fill_in("job_form[new_region]", with: "New Region")
      click_link_or_button("Send")
      expect(page).to have_content("New Company")
    end

    # it "can create a new job with an existing company and new region" do
    #   visit root_path
    #   within(".bottom") do
    #     click_link_or_button("Plus")
    #   end
    #   fill_in("job_form[title]", with: "New Job")
    #   fill_in("job_form[job_description]", with: "New Description")
    #   save_and_open_page
    #   select(@company1.name, from: "job_form[company]")
    #   fill_in("job_form[new_region]", with: "New Region")
    #   click_link_or_button("Send")
    #   expect(page).to have_content("New Company")
    # end
    # xit "can create a new job with an new company and existing region" do
    #   visit root_path
    #   within(".bottom") do
    #     click_link_or_button("Plus")
    #   end
    #   fill_in("job_form[title]", with: "New Job")
    #   fill_in("job_form[job_description]", with: "New Description")
    #   fill_in("job_form[new_company]", with: "New Company")
    #   select(@region1.place, from: "#job_form_region")
    #   click_link_or_button("Send")
    #   expect(page).to have_content("New Company")
    # end
  end
end