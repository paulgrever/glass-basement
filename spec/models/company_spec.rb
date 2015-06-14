require 'rails_helper'

RSpec.describe Company, type: :model do
  before(:each) do 
    @company = Company.create(name: "Company 1")
  end

  it "has a name" do
    expect(@company.name).to eq("Company 1")
  end

  it "cannot have duplicate names" do
    company2 = Company.new(name: "Company 1")
    expect(company2).to_not be_valid
  end
end
