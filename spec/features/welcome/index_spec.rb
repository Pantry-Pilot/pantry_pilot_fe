require 'rails_helper'

RSpec.describe "Welcome Page" do
  describe "As a User" do
    describe "When I visit '/'" do
      it "Then I see a company title, and I also see a logo for Pantry Pilot, and I see a button to create an account" do
        visit "/"

        expect(page).to have_content("Pantry Pilot")
        expect(page).to have_button("Create an Account")
      end

      it "I see a navigation bar with a button to login" do
        visit "/"
        
        expect(page).to have_button("Login")
      end
    end
  end
end
