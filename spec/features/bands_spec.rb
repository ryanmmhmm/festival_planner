require 'rails_helper'

feature "Bands", :type => :feature do
  describe "#new, #create, #show" do
    it "can create a new band" do
      manager = create_user(role: "manager")
      festival = create_festival
      start_time = Time.zone.now
      end_time = start_time + 1.hour

      login_as(manager, scope: :manager)

      visit new_festival_band_path(festival)

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

      band = Band.last
      expect(page).to have_current_path(festival_band_path(festival_id: band.festival_id, id: band.id))
      expect(page).to have_text("You have added a Band to your festival")
      expect(page).to have_text("Band_Name")
      expect(page).to have_text("Band_Description")
      expect(page).to have_text("http://www.band_website.com")
      expect(page).to have_text("http://www.soundcloud.com/band_name")
    end
  end

  describe "#edit, #update" do
    it "allows the user to edit and update the information for a band" do
      manager = create_user(role: "manager")
      festival = create_festival
      band = create_band(festival)

      login_as(manager, scope: :manager)

      visit edit_festival_band_path(festival_id: band.festival_id, id: band.id)

      fill_in :band_name,           with: "Changed_Band_Name"
      select (band.end_time + 1.year).strftime('%Y'),      from: "band_end_time_1i"

      fill_in :band_description,    with: "Changed_Band_Description"
      fill_in :band_website_url,    with: "http://www.changed_band_website.com"
      fill_in :band_soundcloud_url, with: "http://www.soundcloud.com/changed_band_account"

      click_button "Save Changes"

      expect(page).to have_current_path(festival_band_path(festival_id: band.festival_id, id: band.id))
      expect(page).to have_text("Your changes have been saved")
      expect(page).to have_text("Changed_Band_Name")
      expect(page).to have_text("2016")
      expect(page).to have_text("2017")
      expect(page).to have_text("Changed_Band_Description")
      expect(page).to have_text("http://www.changed_band_website.com")
      expect(page).to have_text("http://www.soundcloud.com/changed_band_account")
    end
  end

  describe "#destroy" do
    it "allows the user to remove the band" do
      manager = create_user(role: "manager")
      festival = create_festival
      band = create_band(festival)

      login_as(manager, scope: :manager)

      visit festival_band_path(festival_id: band.festival_id, id: band.id)

      click_button "Delete Band"

      expect(page).to have_current_path(festival_bands_path(festival))
      expect(page).to have_text("Your band has been removed successfully")
    end
  end

  def create_user(email: "default_email@app.com" , password: "default_password", role:)
    User.create!(
        email: email,
        password: password,
        role: role
      )
  end

  def create_band(festival,
    name: "band_name",
    description: "band_description",
    website_url: "http://band_website.com",
    soundcloud_url: "http://soundcloud.com/band_account",
    start_time: Time.zone.now,
    end_time: Time.zone.now + 1.hour
    )

    festival.bands.create!(
      name: name,
      description: description,
      website_url: website_url,
      soundcloud_url: soundcloud_url,
      start_time: start_time,
      end_time: end_time
      )
  end

  def create_festival(
    title: "festival_title",
    location: "festival_location",
    website_url: "http://festival_website.com",
    start_time: Time.zone.now,
    end_time: Time.zone.now + 3.days
    )

    Festival.create!(
      title: title,
      location: location,
      website_url: website_url,
      start_time: start_time,
      end_time: end_time
      )
  end
end
