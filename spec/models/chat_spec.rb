require 'rails_helper'

RSpec.describe Chat, type: :model do
  before(:each) do 
    @job = Job.create(title: "Job1", job_description: "Desciption1")
    @chat = Chat.create(body: "Body 1", job_id: @job.id)
  end

  it "has a relationship with jobs" do
    expect(@chat.job.title).to eq("Job1")
  end
end
