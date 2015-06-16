require "rails_helper"

RSpec.describe User, type: :model do
  it "has attributes" do
    User.find_or_create_by_auth("info" => { uid: 1,
                                            name: "fake name",
                                            image: "fakeurl.com/image.gif",
                                            email: "example@gmail.com" })
    expect(User.count).to eq(1)
  end
end
