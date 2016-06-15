require 'rails_helper'

RSpec.describe Festival, :type => :model do
  it "validates that Festival.title is unique" do
    create_festival(title: "Two of the same")

    expect{ create_festival(title: "Two of the same") }.to raise_error(ActiveRecord::RecordInvalid, /Title has already been taken/)
  end

  def create_festival(title: "festival_title", location: "fesival_location", website_url: "http://festival_website.com", start_time: Time.zone.now, end_time: Time.zone.now + 3.days)
    Festival.create!( title: title,
      location: location,
      website_url: website_url,
      start_time: start_time,
      end_time: end_time
      )
  end
end
