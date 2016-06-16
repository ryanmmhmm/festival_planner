require 'rails_helper'

RSpec.describe Band, :type => :model do
  describe "start_time & end_time" do
    it "validates that end_time > start_time" do
      expect{ create_band!(name: "Timewarp", start_time: Time.zone.now + 1.hour, end_time: Time.zone.now) }.to raise_error(ActiveRecord::RecordInvalid, /End time needs to be greater than start time/)
    end

    it "validates that end_time is present" do
      band = create_band(end_time: nil)

      validation = band.valid?

      expect(validation).to be false
    end

    it "validates that start_time is present" do
      band = create_band(start_time: nil)

      validation = band.valid?

      expect(validation).to be false
    end
  end

  def create_band!(name: "band_name",
    description: "band_description",
    website_url: "http://band_website.com",
    soundcloud_url: "http://soundcloud.com/band_account",
    start_time: Time.zone.now,
    end_time: Time.zone.now + 1.hour
    )

    Band.create!(name: name,
      description: description,
      website_url: website_url,
      soundcloud_url: soundcloud_url,
      start_time: start_time,
      end_time: end_time
      )
  end

  def create_band(name: "band_name",
    description: "band_description",
    website_url: "http://band_website.com",
    soundcloud_url: "http://soundcloud.com/band_account",
    start_time: Time.zone.now,
    end_time: Time.zone.now + 1.hour
    )

    Band.create(name: name,
      description: description,
      website_url: website_url,
      soundcloud_url: soundcloud_url,
      start_time: start_time,
      end_time: end_time
      )
  end
end
