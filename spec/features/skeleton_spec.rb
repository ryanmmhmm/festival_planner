require "rails_helper"

RSpec.describe "Walking Skeleton" do
  it "has a full stack" do
    visit new_skeleton_path

    fill_in "skeleton_data", with: "This data is stored in the database"
    click_button "Save"

    expect(page).to have_current_path(skeleton_path)
    expect(page).to have_text("This data is stored in the database")
  end
end
