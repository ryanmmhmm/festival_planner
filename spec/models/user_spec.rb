RSpec.describe "User" do
  it "can be created and persisted" do
    create_new_user(email: "user@app.com", password: "abcdefg")

    created_user = User.last

    expect(created_user.email).to eq("user@app.com")
  end

  context "user roles" do
    describe "user" do
      it "creates a 'user' by default" do
        user = create_new_user(email: "hello@user.com")

        expect(user.user?).to be true
        expect(user.role).to eq("user")
      end

      it "can be a 'manager'" do
        user = create_new_user(email: "hello@user.com")

        user.manager!

        expect(user.manager?).to be true
        expect(user.role).to eq("manager")
      end

      it "can be an 'admin'" do
        user = create_new_user(email: "hello@user.com")

        user.admin!

        expect(user.admin?).to be true
        expect(user.role).to eq("admin")
      end
    end
  end

  def create_new_user(email:, password: "password", role: "")
    User.create!(
        email: email,
        password: password,
        role: role
      )
  end
end
