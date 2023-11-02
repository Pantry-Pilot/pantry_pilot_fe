require 'rails_helper'

RSpec.describe "User Dashboard Page" do
  describe "As a logged in user" do
    describe "When I visit my user dashboard page '/dashboard'" do
      it "I see a button to redirect me to my dashboard, and I see a button to 'Log out', and I see a message that tells me I am currently logged in as myself, and I see a section titled 'My Recipes'" do
        visit "/login"

        fill_in :email, with: "test@test.com"
        fill_in :password, with: "1234"

        click_on "Login"

        expect(page).to have_content("Welcome, test")
        expect(page).to have_button("My Dashboard")
        expect(page).to have_button("Log out")
        expect(page).to have_content("My Recipes")
      end
    end
  end
end