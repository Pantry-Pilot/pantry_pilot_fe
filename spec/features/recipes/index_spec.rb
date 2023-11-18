require 'rails_helper'

RSpec.feature 'Recipes Index/Search', type: :feature do
  before :each do
    data = {
      data: {
        attributes: {
          name: 'Alex',
          email: 'alex@example.com'
        }
      }
    }
    allow_any_instance_of(UsersFacade).to receive(:get_user).and_return(
      User.new(data)
    )
  end
  scenario 'User searches for a recipe', :vcr do

    visit "/dashboard/search"

    expect(page).to have_content('Search for recipes:')

    fill_in 'query', with: 'chicken'
    click_button 'Search'

    expect(page).to have_current_path("/dashboard/search", ignore_query: true)

    within '#recipes' do
      expect(page).to have_css('.recipe-details', count: 10)
      
      all('.recipe').each do |recipe|
        expect(recipe.find('h2')).to have_link
        expect(recipe).to have_css('img')
      end
    end
  end

  scenario 'User searches for a recipe with no results', :vcr do
    visit "/dashboard/search"
    
    expect(page).to have_content('Search for recipes:')
    
    fill_in 'query', with: 'asdfasdfasdfasdfasdfasdf'
    click_button 'Search'
    
    expect(page).to have_current_path("/dashboard/search", ignore_query: true)
    expect(page).to have_content('No recipes found')
  end

  scenario 'User adds filters to their search', :vcr do
    visit "/dashboard/search"
    
    expect(page).to have_content("Filters")
    
    expect(page).to have_content("Diet")
    expect(page).to have_unchecked_field('diet[gluten free]')
    expect(page).to have_unchecked_field('diet[ketogenic]')
    expect(page).to have_unchecked_field('diet[vegetarian]')
    expect(page).to have_unchecked_field('diet[lacto-vegetarian]')
    expect(page).to have_unchecked_field('diet[ovo-vegetarian]')
    expect(page).to have_unchecked_field('diet[vegan]')
    expect(page).to have_unchecked_field('diet[pescetarian]')
    expect(page).to have_unchecked_field('diet[paleo]')
    expect(page).to have_unchecked_field('diet[primal]')
    expect(page).to have_unchecked_field('diet[low FODMAP]')
    expect(page).to have_unchecked_field('diet[whole30]')
    
    expect(page).to have_content("Intolerances")
    expect(page).to have_unchecked_field('intolerances[dairy]')
    expect(page).to have_unchecked_field('intolerances[egg]')
    expect(page).to have_unchecked_field('intolerances[gluten]')
    expect(page).to have_unchecked_field('intolerances[grain]')
    expect(page).to have_unchecked_field('intolerances[peanut]')
    expect(page).to have_unchecked_field('intolerances[seafood]')
    expect(page).to have_unchecked_field('intolerances[sesame]')
    expect(page).to have_unchecked_field('intolerances[shellfish]')
    expect(page).to have_unchecked_field('intolerances[soy]')
    expect(page).to have_unchecked_field('intolerances[sulfite]')
    expect(page).to have_unchecked_field('intolerances[tree_nut]')
    expect(page).to have_unchecked_field('intolerances[wheat]')
    
    expect(page).to have_content("Include ingredient")
    expect(page).to have_field(:include_ingredient)
    
    expect(page).to have_content("Exclude ingredient")
    expect(page).to have_field(:exclude_ingredient)
    
    fill_in 'query', with: 'chicken'
    check 'intolerances[dairy]'
    check'intolerances[seafood]'
    click_button "Search"
    
    expect(page).to have_current_path("/dashboard/search", ignore_query: true)
    
    within '#recipes' do
      expect(page).to have_css('.recipe-details', count: 10)

      all('.recipe').each do |recipe|
        expect(recipe.find('h2')).to have_link
        expect(recipe).to have_css('img')
      end
    end
  end
end
