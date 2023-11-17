require 'rails_helper'

RSpec.describe "User Dashboard Page" do
  describe "As a logged in user" do
    describe "When I visit my user dashboard page '/dashboard'", :vcr do
      it "I see a button to redirect me to my dashboard, and I see a button to 'Log out', and I see a message that tells me I am currently logged in as myself, and I see a section titled 'My Recipes'", :vcr do
        visit "/login"

        fill_in :email, with: "test@test.com"
        fill_in :password, with: "1234"

        click_on "Login"

        expect(page).to have_content("test's Dashboard")
        # expect(page).to have_button("My Dashboard")
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

        click_on "Logout"

        expect(current_path).to eq("/")

        expect(page).to_not have_button("My Dashboard")
        expect(page).to_not have_button("Logout")
        expect(page).to have_button("Login")
      end
    end

    describe "When I add a recipe to my dashboard", :vcr do 
      it "I see a message that tells me the recipe has been added to my dashboard, along with a link to the recipe show" do
      visit "/login"
        fill_in :email, with: "test@test.com"
        fill_in :password, with: "1234"

        click_on "Login"

        expect(current_path).to eq("/dashboard")
        click_on "Search Recipes"
        expect(current_path).to eq("/dashboard/search")
        fill_in :query, with: "chicken"
        click_on "Search"
        expect(page).to have_link "Chicken 65"
        click_on "Chicken 65"
        expect(page).to have_button "Add Recipe to my dashboard"
        click_on "Add Recipe to my dashboard"
        expect(current_path).to eq("/dashboard")
      end 
    end

    describe "When I delete a recipe from my dashboard", :vcr do
      it "deletes the recipe from my dashboard" do
        visit "/login"
        fill_in :email, with: "test@test.com"
        fill_in :password, with: "1234"

        click_on "Login"

        expect(current_path).to eq("/dashboard")
        click_on "Search Recipes"
        expect(current_path).to eq("/dashboard/search")
        fill_in :query, with: "Tofu"
        click_on "Search"
        expect(page).to have_link "Tofu Gratin"
        click_on "Tofu Gratin"
        expect(page).to have_button "Add Recipe to my dashboard"
        click_on "Add Recipe to my dashboard"
        expect(current_path).to eq("/dashboard")
        expect(page).to have_content("Tofu Gratin")
        within("#user_recipe-663505") do 
          expect(page).to have_button("Remove from My Recipes")
          click_on "Remove from My Recipes"
        end
        expect(current_path).to eq("/dashboard")
        expect(page).to_not have_content("Tofu Gratin")
      end 
    end
  end
end
