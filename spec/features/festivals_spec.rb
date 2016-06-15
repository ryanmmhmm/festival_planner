require 'rails_helper'

feature "Festivals", :type => :feature do
  describe "restful resources" do
    it "#new, #update, #show" do
      manager = create_user(role: "manager")
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

    it "#edit, #update" do
      manager = create_user(role: "manager")
      festival = create_festival

      login_as(manager, scope: :manager)

      visit edit_festival_path(festival)

      fill_in :festival_title,                    with: "changed_festival_title"
      select start_time.strftime('%Y'),           from: "festival_start_time_1i"
      select end_time.strftime('%Y') + 1,         from: "festival_end_time_1i"
      fill_in :festival_location,                 with: "changed_festival_location"
      fill_in :festival_website_url,              with: "http://changed_website_url.com"

      click_button "Modify Festival"

      expect(page).to have_current_path(festival_path(festival))
      expect(page).to have_text("Your festival has been updated")
      expect(page).to have_text("changed_festival_title")
      expect(page).to have_text("changed_festival_location")
      expect(page).to have_text("http://changed_website_url.com")
    end
  end

  def create_festival(
    title: "festival_title",
    location: "festival_location",
    website_url: "http://festival_website_url.com",
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

  def create_user(email: "default_email@app.com" , password: "default_password", role:)
    User.create!(
        email: email,
        password: password,
        role: role)
  end
end
