require 'rails_helper'

feature "Festivals", :type => :feature do
  describe "#new" do
    it "creates new Festivals" do
      manager = User.create(email: "user1@app.com", password: "password")

      login_as(manager, scope: :manager)

      visit new_festival_path

      fill_in :festival_title,       with: "Bestival"
      fill_in :festival_start_time,  with: Time.now
      fill_in :festival_end_time,    with: Time.now + 3.days
      fill_in :festival_location,    with: "Toronto, Ontario"

      click_button "Manage your Festival"

      expect(page).to have_current_path(festival_path(Festival.last))
      expect(page).to have_text("Thank you for creating a new festival!")
      expect(page).to have_text("Bestival")
      expect(page).to have_text("Toronto, Ontario")
      expect(page).to have_text(Time.now)
      expect(page).to have_text(Time.now + 3.days)
    end
  end
end
