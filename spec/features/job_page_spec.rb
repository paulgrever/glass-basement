require "rails_helper"

RSpec.describe "User", type: :feature do
  context "on the jobs index page" do
    before(:each ) do
      Region.create(place: "Wisconsin")
      Region.create(place: "Remote")
      Region.create(place: "Colorado")
    end

    it "displays the region on the page" do
      visit root_path
      expect(page).to have_content("Wisconsin")
    end
  end
end