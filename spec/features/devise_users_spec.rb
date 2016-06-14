require 'rails_helper'

RSpec.describe "DeviseUsers" do
  xcontext "confirmations" do
    it "confirms your account creation" do
    end
  end

  xcontext "passwords" do
    it "resets your password" do
    end
  end

  context "registrations" do
    it "allows you to sign up" do
      visit new_user_registration_path

      fill_in :user_email,                  with: "user1@app.com"
      fill_in :user_password,               with: "password"
      fill_in :user_password_confirmation,  with: "password"

      click_button "Create Account"

      expect(page).to have_current_path("/")
      expect(page.body).to have_text("Welcome! You have signed up successfully.")
    end
  end

  context "sessions" do
    it "allows you to sign in" do
      User.create!(email: "user1@app.com", password: "password")

      visit new_user_session_path

      fill_in :user_email,    with: "user1@app.com"
      fill_in :user_password, with: "password"

      click_button "Log in"

      expect(page).to have_current_path(root_path)
      expect(page.body).to have_text(/Signed in successfully/)
    end

    it "allows you to log out" do
      user = User.create(email: "user1@app.com", password: "password")
      login_as(user, scope: :user)

      visit new_user_session_path
      expect(page.body).to have_text("You are already signed in.")
      expect(page).to have_current_path(root_path)

      click_button "Logout"
    end
  end

  xcontext "unlocks" do
    xit "enables you to unlock your account" do
    end
  end
end
