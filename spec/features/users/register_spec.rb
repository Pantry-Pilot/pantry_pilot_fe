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

      describe "When I fill in passwords that do not match" do
        it "I am redirected to the registration form, and I see an error message telling me that my passwords do not match" do
          visit "/register"

          fill_in :name, with: "test2"
          fill_in :email, with: "test2@test.com"
          fill_in :password, with: "password1"
          fill_in :confirm_password, with: "password2"

          click_on "Submit"

          expect(current_path).to eq("/register")
          expect(page).to have_content("Passwords do not match")
        end
      end

      describe "When I do not fill in all fields" do
        it "I am redirected to the registration form, and I see an error message telling me that I am missing required information" do
          visit "/register"

          fill_in :email, with: "test3@test.com"
          fill_in :password, with: "password"
          fill_in :confirm_password, with: "password"


          click_on "Submit"

          expect(current_path).to eq("/register")
          expect(page).to have_content("Name can't be blank")
        end
      end
    end
  end
end
