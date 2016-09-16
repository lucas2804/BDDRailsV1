require "rails_helper"
RSpec.feature "Users can view projects" do
  let(:user) {FactoryGirl.create :user, :admin}
  let(:project) {FactoryGirl.create :project, name: "Sublime Text 3"}

  before do
    login_as user
    assign_role!(user, :viewer, project)
  end

  scenario "with the project details" do
    visit admin_projects_path
    click_link "Sublime Text 3"
    expect(page.current_url).to eq admin_project_url(project)
  end
end