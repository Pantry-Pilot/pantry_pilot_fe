require 'rails_helper'
RSpec.describe "Adding an ingredient to a user's pantry" do 
  before :each do
    visit "/login"
  
    fill_in :email, with: "test@test.com"
    fill_in :password, with: "1234"
  
    click_on "Login"
  end
  describe "adding an ingredient", :vcr do 
    it "has a form where I can input name, quantity, and expiration date" do
      visit "/pantry/new"

      expect(page).to have_content("Add an ingredient to Your Pantry")
      expect(page).to have_field("name")
      expect(page).to have_field("quantity")
      expect(page).to have_field("exp_date")
      expect(page).to have_button("Add Ingredient")
    end

    it "can fill out the form and be redirected to the pantry page" do
      visit "/pantry/new"

      fill_in :name, with: "chicken"
      fill_in :quantity, with: "1"
      fill_in :exp_date, with: "2021-10-10"

      click_on "Add Ingredient"

      expect(current_path).to eq("/pantry")
    end
  end
end