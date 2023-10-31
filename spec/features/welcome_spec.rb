require 'rails_helper'

RSpec.describe "Welcome Page" do
  describe "As a User" do
    describe "When I visit '/'" do
      it "Then I see a company title, and I also see a logo for Pantry Pilot, and I see a button to create an account" do
        visit "/"

        expect(page).to have_content("Pantry Pilot")
        expect(page).to have_xpath("//img[@src='https://www.realsimple.com/thmb/TQPhL9GrDM4-LuTBQQPSq9d7oyo=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/how-to-organize-pantry-e6f98662eed64700a7a39c11fec696c8.jpg']")
        expect(page).to have_button("Create an Account")
      end

      it "I see a navigation bar with a button to login" do
        visit "/"
        save_and_open_page
        expect(page).to have_button("Login")
      end
    end
  end
end