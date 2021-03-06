require "rails_helper"

RSpec.feature "Users can only see the appropriate links" do
  let(:user) { FactoryGirl.create :user }
  let(:admin) { FactoryGirl.create :user, :admin }
  let(:project) { FactoryGirl.create(:project) }
  context "anonymous users" do
    scenario "cannot see the New Project link" do
      visit admin_projects_path
      expect(page).not_to have_link "New Project"
    end

    scenario "cannot see the Delete Project link" do
      visit admin_project_path(project)
      expect(page).not_to have_link "Delete Project"
    end
  end

  context "regular users" do
    before { login_as(user) }
    scenario "cannot see the New Project link" do
      visit admin_projects_path
      expect(page).not_to have_link "New Project"
    end

    scenario "cannot see the Delete Project link" do
      visit admin_project_path project
      expect(page).not_to have_link "Delete Project"
    end

  end

  context "admin users" do
    before { login_as(admin) }
    scenario  "be able to see the New Project link" do
      visit admin_projects_path
      expect(page).to have_link "New Project"
    end

    scenario "be able to see the Delete Project link" do
      assign_role! admin, :viewer, project
      visit admin_project_path project
      expect(page).to have_link "Delete Project"
    end

  end
end