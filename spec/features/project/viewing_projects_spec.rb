require "rails_helper"
RSpec.feature "Users can view projects" do
  scenario "with the project details" do
    project = FactoryGirl.create(:project, name: "Sublime Text 3")
    visit admin_projects_path
    click_link "Sublime Text 3"
    expect(page.current_url).to eq admin_project_url(project)
  end
end