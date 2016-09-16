require "rails_helper"

RSpec.describe ProjectPolicy do
  subject { described_class } #ProjectPolicy

  permissions :show? do
    let(:admin) { FactoryGirl.create :user, :admin }
    let(:project) { FactoryGirl.create :project }

    it "blocks anonymous users" do
      expect(subject).not_to permit(nil, project)
    end

    it "allows viwers of the project" do
      assign_role! admin, :viewer, project
      expect(subject).to permit admin, project
    end

    it "allows editors of the project" do
      assign_role! admin, :editor, project
      expect(subject).to permit admin, project
    end

    it "allows managers of the project" do
      assign_role! admin, :manager, project
      expect(subject).to permit admin, project
    end

    it "doesn't allow users assigned to other projects" do
      other_project = FactoryGirl.create :project
      assign_role! admin, :manager, other_project
      expect(subject).not_to permit admin, project
    end

  end
end