require 'rails_helper'

# RSpec.describe "Login Page" do
#   describe "As a user," do
#     describe "When I am on the home page and click the 'Login' button" do
#       it "I see a form to log in that includes a field for my email and a field for my password." do
#         visit "/"

#         click_on "Login"

#         expect(current_path).to eq("/login")

#         expect(page).to have_content("Email:")
#         expect(page).to have_field("email")
#         expect(page).to have_content("Password:")
#         expect(page).to have_field("password")
#       end

#       describe "When I fill out the form with valid credentials and I click 'submit'" do
#         it "I am taken to my dashboard page '/dashboard, where I no longer see a button to log in, and I now see a button to log out instead" do
#           visit "/"

#           click_on "Create an Account"

#           fill_in :name, with: "Lane B"
#           fill_in :email, with: "lane@example.com"
#           fill_in :password, with: "laneiscool"

#           click_on "Submit"

#           fill_in :email, with: "lane@example.com"
#           fill_in :password, with: "laneiscool"

#           click_on "Login"

#           expect(current_path).to eq("/dashboard")

#           expect(page).to have_button("Log out")
#           expect(page).to_not have_button("Login")
#         end
#       end

#       describe "When I log in with in invalid credentials" do
#         it "I am redirected to the login page and I see an error message that tells me that I did not use valid credentials" do
#           visit "/"

#           click_on "Create an Account"

#           fill_in :name, with: "Lane B"
#           fill_in :email, with: "lane@example.com"
#           fill_in :password, with: "laneiscool"

#           click_on "Submit"

#           fill_in :email, with: "lane@example.com"
#           fill_in :password, with: "laneisnotcool"

#           click_on "Submit"

#           expect(current_path).to eq("/login")

#           expect(page).to have_content("Invalid credentials")
#         end
#       end
#     end
#   end
# end