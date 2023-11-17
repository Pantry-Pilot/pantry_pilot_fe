require 'rails_helper'

RSpec.describe "Pantry Page" do
  before :each do
    visit "/login"
  
    fill_in :email, with: "test@test.com"
    fill_in :password, with: "1234"
  
    click_on "Login"
  end

  describe "when I visit '/pantry", :vcr do 
    it "has a list of my ingredients" do 
      visit "/pantry/new"

      fill_in :name, with: "greens"
      fill_in :quantity, with: "1"
      fill_in :exp_date, with: "2021-10-10"

      click_on "Add Ingredient"

      expect(current_path).to eq("/pantry")
      expect(page).to have_content("greens")
      expect(page).to have_content("1")
      expect(page).to have_content("October 10, 2021")
      expect(page).to have_button("Delete")
    end

    it "has a delete button to delete an ingredient" do
      visit "/pantry/new"

      fill_in :name, with: "salt"
      fill_in :quantity, with: "1"
      fill_in :exp_date, with: "2021-10-10"

      click_on "Add Ingredient"
      within "#ingredient-salt" do 
        expect(current_path).to eq("/pantry")
        expect(page).to have_content("salt")
        expect(page).to have_content("1")
        expect(page).to have_content("October 10, 2021")
        expect(page).to have_button("Delete")
        click_on "Delete"
      end 

        expect(current_path).to eq("/pantry")
        expect(page).to_not have_content("salt")
    end
  end 
end