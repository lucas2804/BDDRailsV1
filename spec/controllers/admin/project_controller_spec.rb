require "rails_helper"

RSpec.describe Admin::ProjectsController, type: :controller do
  let(:user) {FactoryGirl.create(:user, :admin)}

  before do
    allow(controller).to receive :authenticate_user!
    allow(controller).to receive(:current_user).and_return(user)
  end

  it "handles a missing project correctly" do
    get :show, id: "not-here"
    expect(response).to redirect_to(admin_projects_path)
    message = "The project you were looking for could not be found."
    expect(flash[:alert]).to eq message
  end

  # it "handles permission errors by redirecting to a safe place" do
  #   project = FactoryGirl.create :project
  #   assign_role! user, :viewer, project
  #   get :show, id: project
  #   expect(response).to redirect_to(root_path)
  #   message = "You aren't allowed to do that."
  #   expect(flash[:alert].to eq message)
  # end
end