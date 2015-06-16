require "rails_helper"

RSpec.describe SessionsHelper, type: :helper do
  it "has a current user that works" do
    user = User.create!
    session[:user_id] = user.id
    expect(current_user.id).to eq(user.id)
  end
end
