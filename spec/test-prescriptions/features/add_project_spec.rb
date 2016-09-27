require 'rails_helper'

RSpec.feature "adding Projects" do

  let(:admin) {FactoryGirl.create :user, :admin}
  before do
    login_as(admin)
    visit admin_projects_path
    click_link "New Project"
  end

  it "allows a user to create a project with tasks" do
    fill_in "Name", with: "Project Runway"
    fill_in "Tasks", with: "Task 1:3\nTask 2:5"
    click_on "Create Project"
    visit admin_projects_path
    expect(page).to have_content("Project Runway")
    expect(page).to have_content("8")
  end
end