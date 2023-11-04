require 'rails_helper'

RSpec.feature 'Recipe show page', type: :feature do
  scenario 'User visits recipe show page', :vcr do
    visit "/dashboard/search/637876"
    
    expect(page).to have_content("Chicken 65")
    expect(page).to have_content("Chicken 65 could be just the gluten free recipe you've been looking for")
    expect(page).to have_content("500.0 grams chicken breast")
    expect(page).to have_content("2.0 tsp chili powder")
    expect(page).to have_content("Take a large bowl mix in the ginger and garlic paste, yogurt, red chilly powder, turmeric powder, and salt.")
    expect(page).to have_content("Mix well to from smooth and thick paste, add the chicken pieces to the masala paste and marinaded for 4 hours.")
  end
end