require "rails_helper"

RSpec.describe "Chat", type: :feature do
  context "posting a chat", js: true  do
    before(:each) do
      @region1 = Region.create(place: "Wisconsin")
      @company1= Company.create(name: "Econify")
      @job1 = Job.create(title: "Job1", job_description: "description1")
      @region1.companies << @company1
      @company1.jobs << @job1
    end

    xit "can chat"do
      visit root_path
      first(".collapsible-header").click
      click_link_or_button("Job1")
      fill_in("chat[body]", with: "Hello")
      click_link_or_button("Send")
      expect(page).to have_content("Hello")
    end

    it "clears the input after submission" do
      visit job_path(@job1)
      fill_in("chat[body]", with: "Hello")
      click_link_or_button("Send")
      within("#chat-input") do 
        expect(page).to_not have_content("Hello")
      end
    end
  end
end