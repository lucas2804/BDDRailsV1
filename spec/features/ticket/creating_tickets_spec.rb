require "rails_helper"
RSpec.feature "Users can create new tickets" do
  let(:admin) {FactoryGirl.create(:user, :admin)}
  before do
    project = FactoryGirl.create(:project, name: "Internet Explorer")
    assign_role! admin, :viewer, project
    login_as(admin)
    visit admin_project_path(project)
    click_link "New Ticket"
  end
  scenario "with valid attributes" do
    fill_in "Name", with: "Non-standards compliance"
    fill_in "Description", with: "My pages are ugly!"
    click_button "Create Ticket"
    expect(page).to have_content "Ticket was successfully created"
    within ("#tickets") do
      expect(page).to have_content "Author: #{admin.email}"
    end
  end
  scenario "when providing invalid attributes" do
    click_button "Create Ticket"
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Description can't be blank"
  end
end