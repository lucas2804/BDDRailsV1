require "rails_helper"
RSpec.feature "Users can delete tickets" do
  let(:author)  { FactoryGirl.create(:user, :admin) }
  let(:project) { FactoryGirl.create(:project) }
  let(:ticket) { FactoryGirl.create(:ticket, project: project, author: author) }
  before do
    login_as(author)
    assign_role! author, :viewer, project
    visit admin_project_ticket_path(project, ticket)
  end
  scenario "successfully" do
    click_link "Delete Ticket"
    expect(page).to have_content "Ticket was successfully destroyed."
    expect(page.current_url).to eq admin_project_url(project)
  end
end
