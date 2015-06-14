require 'rails_helper'

RSpec.describe Job, type: :model do
  before(:each) do 
    @job = Job.create(title: "Title 1", job_description: "Description")
  end
  it "can create a job" do
    expect(@job.title).to eq("Title 1")
    expect(@job.job_description).to eq("Description")
  end
end
