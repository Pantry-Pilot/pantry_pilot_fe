require 'rails_helper'

RSpec.describe "User Dashboard Page" do
  describe "As a logged in user" do
    describe "When I visit my user dashboard page '/dashboard'", :vcr do
      it "I see a button to redirect me to my dashboard, and I see a button to 'Log out', and I see a message that tells me I am currently logged in as myself, and I see a section titled 'My Recipes'", :vcr do
        visit "/login"

        fill_in :email, with: "test@test.com"
        fill_in :password, with: "1234"

        click_on "Login"
        save_and_open_page
        expect(page).to have_content("Welcome, test")
        expect(page).to have_button("My Dashboard")
        expect(page).to have_button("Logout")
        expect(page).to have_content("My Recipes")
      end
    end

    describe "When I click the 'Log out' button", :vcr do
      it "I am redirected to the welcome page, where I no longer see a button to 'Log out' or a button called 'My Dashboard', but I do see a button to 'Login'" do
        visit "/login"

        fill_in :email, with: "test@test.com"
        fill_in :password, with: "1234"

        click_on "Login"

        click_on "Log out"

        expect(current_path).to eq("/")

        expect(page).to_not have_button("My Dashboard")
        expect(page).to_not have_button("Logout")
        expect(page).to have_button("Login")
      end
    end
  end
end
