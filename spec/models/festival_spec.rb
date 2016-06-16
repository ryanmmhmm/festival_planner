require 'rails_helper'

RSpec.describe Festival, :type => :model do
  it "validates that Festival.title is unique" do
    create_festival(title: "Two of the same")

    expect{ create_festival(title: "Two of the same") }.to raise_error(ActiveRecord::RecordInvalid, /Title has already been taken/)
  end

  describe "end_time & start_time" do
    it "validates that start_time is present" do
      festival = create_festival_no_bang(start_time: nil)

      validation = festival.valid?

      expect(validation).to be false
    end

    it "validates that end_time is present" do
      festival = create_festival_no_bang(end_time: nil)

      validation = festival.valid?

      expect(validation).to be false
    end

    it "custom validates that end_time > start_time" do
      expect{ create_festival(title: "Timewarp", start_time: Time.zone.now + 1.hour, end_time: Time.zone.now) }.to raise_error(ActiveRecord::RecordInvalid, /End time needs to be greater than start time/)
    end
  end

  def create_festival(title: "festival_title", location: "fesival_location", website_url: "http://festival_website.com", start_time: Time.zone.now, end_time: Time.zone.now + 3.days)
    Festival.create!( title: title,
      location: location,
      website_url: website_url,
      start_time: start_time,
      end_time: end_time
      )
  end

  def create_festival_no_bang(title: "festival_title", location: "fesival_location", website_url: "http://festival_website.com", start_time: Time.zone.now, end_time: Time.zone.now + 3.days)
    Festival.create( title: title,
      location: location,
      website_url: website_url,
      start_time: start_time,
      end_time: end_time
      )
  end
end
