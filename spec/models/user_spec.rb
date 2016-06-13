RSpec.describe "User" do
  it "can be created and persisted" do
    User.create!(
        email: "user@app.com",
        password: "abcdefg"
      )

    created_user = User.last

    expect(created_user.email).to eq("user@app.com")
  end
end
