require 'rails_helper'

RSpec.describe Region, type: :model do
  before(:each) do
    @region = Region.create(place: "Wisconsin")
    @company = Company.create(name: "HQ")
  end

  it "has a place" do
    expect(@region.place).to eq("Wisconsin")
  end

  it "is unique" do
    region2 = Region.new(place: "Wisconsin")
    expect(region2).to_not be_valid
  end

  it "has companies associated with the region" do
    @region.companies << @company
    expect(@region.companies.first.name).to eq("HQ")
  end
end
