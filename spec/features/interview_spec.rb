require "rails_helper"
require "selenium-webdriver"

RSpec.describe "Chat", type: :feature do
  before "@javascript" do
    window = Capybara.current_session.driver.browser.manage.window
    window.resize_to(1024, 768) # width, height
  end
  context "posting a chat", js: true do
    before(:each ) do
      @company = Company.create(name: "Company 1")
      @job = Job.create(title: "Title 1",
                        job_description: "Description",
                        company_id: @company.id)
      @user = User.create(uid: "123455",
                          name: "Paul Grever",
                          email: "paulgrever@gmail.com",
                          image: "https://avatars.githubusercontent.com/u/3664281?v=3")
      @interview = @job.interviews.create(title: "Interview 1",
                                          number: 1,
                                          interview_type: "phone",
                                          details: "Met with John Smith on the phone",
                                          date: "2014-09-20",
                                          time_between: "2 weeks",
                                          questions: "Question 1: How was your day?",
                                          interviewer_name: "Paul Grever",
                                          interviewer_email: "paulgrever@gmail.com",
                                          interviewer_phone: "608-239-2471",
                                          user_id: @user.id)
    end

    it "displays the interview information" do
      visit job_path(@job)
      expect(page).to have_content("Interview 1")
    end

    it "has more details after clicking" do
      visit job_path(@job)
      expect(page).to_not have_content("Question 1: How was your day?")
      find('.icon-button').click
      expect(page).to have_content("Question 1: How was your day?")
    end
  end
end
