RSpec.describe "layouts/application.html.erb" do
  xit "has flash[:notice] messages" do
    user = User.create(email: "user1@app.com", password: "password")
    login_as(user, scope: :user)
    flash[:notice] = "This is a flash notice"

    render

    expect(rendered).to match /This is a flash notice/
  end

  xit "has flash[:notice] messages" do
    flash[:alert] = "This is a flash alert"

    render

    expect(rendered).to match /This is a flash alert/
  end
end