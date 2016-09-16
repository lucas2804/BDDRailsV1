require "rails_helper"
RSpec.feature "Users can edit existing projects" do
  let(:admin) { FactoryGirl.create(:user, :admin) }
  before do
    project = FactoryGirl.create(:project, name: "Sublime Text 3")
    assign_role! admin, :viewer, project
    login_as admin
    visit admin_projects_path
    click_link "Sublime Text 3"
    click_link "Edit Project"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "Sublime Text 4 beta"
    click_button "Update Project"
    expect(page).to have_content "Project was successfully updated"
    expect(page).to have_content "Sublime Text 4 beta"
  end

  scenario "when providing invalid attributes" do
    fill_in "Name", with: ""
    click_button "Update Project"
    expect(page).to have_content "Name can't be blank"
  end
end