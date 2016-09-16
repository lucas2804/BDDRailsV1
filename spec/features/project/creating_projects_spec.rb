require "rails_helper"
RSpec.feature "Users can create new projects" do
  let(:admin) {FactoryGirl.create :user, :admin}
  before do
    login_as(admin)
    visit admin_projects_path
    click_link "New Project"
  end

  # scenario "with valid attributes" do
  #   fill_in "Name", with: "Sublime Text 3"
  #   fill_in "Description", with: "A text editor for everyone"
  #   click_button "Create Project"
  #   expect(page).to have_content "Project was successfully created."
  # end

  # scenario "with INVALID attributes" do
  #   fill_in "Name", with: ""
  #   fill_in "Description", with: "A text editor for everyone"
  #   click_button "Create Project"
  #   expect(page).to have_content "Name can't be blank"
  # end
end

