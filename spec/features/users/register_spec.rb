require 'rails_helper'

RSpec.describe "Register Page" do
  describe "As a user" do
    describe "When I click on 'Create an Account' Button on the home page" do
      it "I am taken to a form to register that includes a field for my name, email, password, and confirm password" do
        visit "/"

        click_on "Create an Account"

        expect(current_path).to eq("/register")

        expect(page).to have_content("Name:")
        expect(page).to have_field("name")
        expect(page).to have_content("Email:")
        expect(page).to have_field("email")
        expect(page).to have_content("Password:")
        expect(page).to have_field("password")
        expect(page).to have_content("Confirm password:")
        expect(page).to have_field("confirm_password")
      end

      describe "When I fill in my information and click 'Submit'" do
        it "I am taken to the user login page '/login'" do
          visit "/register"

          VCR.use_cassette("lane_register") do
            fill_in :name, with: "Lane"
            fill_in :email, with: "lane@example.com"
            fill_in :password, with: "laneiscool"
            fill_in :confirm_password, with: "laneiscool"

            click_on "Submit"
          end

          expect(current_path).to eq("/login")
        end
      end
    end
  end
end