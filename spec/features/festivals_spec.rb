require 'rails_helper'

feature "Festivals", :type => :feature do
  describe "#new" do
    it "creates new Festivals" do
      manager = User.create(email: "user1@app.com", password: "password")
      start_time = Time.zone.now
      end_time = start_time + 3.days

      login_as(manager, scope: :manager)

      visit new_festival_path

      fill_in :festival_title,                    with: "Bestival"
      select start_time.strftime('%Y'),           from: "festival_start_time_1i"
      select Date::MONTHNAMES[start_time.month],  from: "festival_start_time_2i"
      select start_time.strftime('%d'),           from: "festival_start_time_3i"
      select start_time.strftime('%H'),           from: "festival_start_time_4i"
      select start_time.strftime('%M'),           from: "festival_start_time_5i"

      select end_time.strftime('%Y'),             from: "festival_end_time_1i"
      select Date::MONTHNAMES[end_time.month],    from: "festival_end_time_2i"
      select end_time.strftime('%d'),             from: "festival_end_time_3i"
      select end_time.strftime('%H'),             from: "festival_end_time_4i"
      select end_time.strftime('%M'),             from: "festival_end_time_5i"
      fill_in :festival_location,                 with: "Toronto, Ontario"
      fill_in :festival_website_url,              with: "http://bestival.com"

      click_button "Manage your Festival"

      expect(page).to have_current_path(festival_path(Festival.last))
      expect(page).to have_text("Thank you for creating a new festival!")
      expect(page).to have_text("Bestival")
      expect(page).to have_text("Toronto, Ontario")
      expect(page).to have_text("http://bestival.com")
      # removing tests for start_time and end_time because formatting will change
    end
  end
end
