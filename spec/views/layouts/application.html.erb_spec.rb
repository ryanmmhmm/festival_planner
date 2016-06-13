RSpec.describe "layouts/application.html.erb" do
  it "has flash[:notice] messages" do
    flash[:notice] = "This is a flash notice"

    render

    expect(rendered).to match /This is a flash notice/
  end

  it "has flash[:notice] messages" do
    flash[:alert] = "This is a flash alert"

    render

    expect(rendered).to match /This is a flash alert/
  end
end