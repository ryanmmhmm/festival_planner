require 'rails_helper'

RSpec.describe "User features" do
  it "has a profile page" do
    user = User.create(email: "user1@app.com", password: "password")
    login_as(user, scope: :user)

    visit user_path(user)

    expect(page).to have_text(/Profile/)
    expect(page).to have_content(user.email)
  end
end
