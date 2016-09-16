require "rails_helper"
RSpec.feature "Users can edit existing tickets" do
  let(:user) { FactoryGirl.create(:user, :admin) }
  let(:project) { FactoryGirl.create(:project) }
  let(:ticket) { FactoryGirl.create(:ticket, project: project) }
  before do
    login_as user
    assign_role! user, :viewer, project
    visit admin_project_ticket_path(project, ticket)
    click_link "Edit Ticket"
  end
  scenario "with valid attributes" do
    fill_in "Name", with: "Make it really shiny!"
    click_button "Update Ticket"
    expect(page).to have_content "Ticket was successfully updated."
    expect(page).to have_content "Make it really shiny!"
    expect(page).not_to have_content ticket.name
  end
  scenario "with invalid attributes" do
    fill_in "Name", with: ""
    click_button "Update Ticket"
    expect(page).to have_content "Name can't be blank"
  end
end