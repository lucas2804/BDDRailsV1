require "rails_helper"
RSpec.feature "Signed-in users can sign out" do
  let!(:user) { FactoryGirl.create(:user) }
  before do
    login_as(user)
  end
  scenario do
    visit "/"
    click_button "Sign out"
    expect(page).to have_content "Signed out successfully."
  end
end

# login_as doesn't include in Warden
# -> include spec/rails_helper.rb at the bottom of the RSpec.configure block.
# config.include Warden::Test::Helpers, type: :feature
# config.after(type: :feature) { Warden.test_reset! }