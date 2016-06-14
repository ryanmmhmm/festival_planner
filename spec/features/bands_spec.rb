require 'rails_helper'

feature "Bands", :type => :feature do
  describe "#new" do
    it "can create a new band" do
      manager = User.create!(
        email: "email@app.com",
        password: "password")
      start_time = Time.zone.now
      end_time = start_time + 1.hour

      login_as(manager, scope: :manager)

      visit new_band_path

      fill_in :band_name, with: "Band_Name"
      select start_time.strftime('%Y'),           from: "band_start_time_1i"
      select Date::MONTHNAMES[start_time.month],  from: "band_start_time_2i"
      select start_time.strftime('%d'),           from: "band_start_time_3i"
      select start_time.strftime('%H'),           from: "band_start_time_4i"
      select start_time.strftime('%M'),           from: "band_start_time_5i"

      select end_time.strftime('%Y'),             from: "band_end_time_1i"
      select Date::MONTHNAMES[end_time.month],    from: "band_end_time_2i"
      select end_time.strftime('%d'),             from: "band_end_time_3i"
      select end_time.strftime('%H'),             from: "band_end_time_4i"
      select end_time.strftime('%M'),             from: "band_end_time_5i"

      fill_in :band_description, with: "Band_Description"
      fill_in :band_website_url, with: "http://www.band_website.com"
      fill_in :band_soundcloud_url, with: "http://www.soundcloud.com/band_name"

      click_button "Add Band"

      expect(page).to have_current_path(band_path(Band.last))
      expect(page).to have_text("You have added a Band to your festival")
      expect(page).to have_text("Band_Name")
      expect(page).to have_text("Band_Description")
      expect(page).to have_text("http://www.band_website.com")
      expect(page).to have_text("http://www.soundcloud.com/band_name")
    end
  end
end
