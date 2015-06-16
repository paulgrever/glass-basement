require "rails_helper"

RSpec.describe SessionsController, type: :controller do
  it "has a destroy that resets the user_id in the session" do
    session[:user_id] = "something"
    expect(session[:user_id]).to eq("something")

    delete :destroy
    expect(session[:user_id]).to eq(nil)
  end
end
