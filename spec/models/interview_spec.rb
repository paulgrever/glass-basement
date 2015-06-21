require 'rails_helper'

RSpec.describe Interview, type: :model do
  before(:each) do 
    @company = Company.create(name: "Company 1")
    @job = Job.create(title: "Title 1",
                      job_description: "Description",
                      company_id: @company.id)
    @user = User.create(uid: "123455", name: "Paul Grever", email: "paulgrever@gmail.com", image: "https://avatars.githubusercontent.com/u/3664281?v=3")
    @interview = @job.interviews.create(title: "Interview 1",
                                        number: 1,
                                        interview_type: "phone",
                                        details: "Met with John Smith on the phone, he was nice",
                                        date: "2014-09-20",
                                        time_between: "2 weeks",
                                        questions: "Question 1: How was your day?",
                                        interviewer_name: "Paul Grever",
                                        interviewer_email: "paulgrever@gmail.com",
                                        interviewer_phone: "608-239-2471", 
                                        user_id: @user.id)
  end

  it "is valid with all fields" do
    expect(@interview).to be_valid
  end

  it "has a relationship with jobs" do
    expect(@interview.job.title).to eq("Title 1")
  end

  it "has a relationship with users" do
    expect(@interview.user.name).to eq("Paul Grever")
  end

  it "is invalid without a job id " do
    interview = Interview.new(title: "Interview 1",
                              number: 1,
                              interview_type: "phone",
                              details: "Met with John Smith on the phone, he was nice",
                              date: "2014-09-20",
                              time_between: "2 weeks",
                              questions: "Question 1: How was your day?",
                              interviewer_name: "Paul Grever",
                              interviewer_email: "paulgrever@gmail.com",
                              interviewer_phone: "608-239-2471", 
                              user_id: @user.id)
    expect(interview).to_not be_valid
  end

  it "is invalid without a user_id " do
    interview = Interview.new(title: "Interview 1",
                              job_id: @job.id,
                              number: 1,
                              interview_type: "phone",
                              details: "Met with John Smith on the phone, he was nice",
                              date: "2014-09-20",
                              time_between: "2 weeks",
                              questions: "Question 1: How was your day?",
                              interviewer_name: "Paul Grever",
                              interviewer_email: "paulgrever@gmail.com",
                              interviewer_phone: "608-239-2471", 
                              user_id: nil)
    expect(interview).to_not be_valid
  end

  it "is invalid without a title" do
    interview = Interview.new(title: nil,
                              job_id: @job.id,
                              number: 1,
                              interview_type: "phone",
                              details: "Met with John Smith on the phone, he was nice",
                              date: "2014-09-20",
                              time_between: "2 weeks",
                              questions: "Question 1: How was your day?",
                              interviewer_name: "Paul Grever",
                              interviewer_email: "paulgrever@gmail.com",
                              interviewer_phone: "608-239-2471", 
                              user_id: @user.id)
    expect(interview).to_not be_valid
  end
end
