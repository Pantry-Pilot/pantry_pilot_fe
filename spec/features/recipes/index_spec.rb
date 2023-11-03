require 'rails_helper'

RSpec.feature 'Recipes Index/Search', type: :feature do
  scenario 'User searches for a recipe', :vcr do
    visit recipes_path

    expect(page).to have_content('Search for recipes:')

    fill_in 'query', with: 'chicken'
    click_button 'Search'

    expect(page).to have_current_path(recipes_path, ignore_query: true)

    within '#recipes' do
      expect(page).to have_css('.recipe', count: 10)

      all('.recipe').each do |recipe|
        expect(recipe.find('h2')).to have_link
        expect(recipe).to have_css('img')
      end
    end
  end

  scenario 'User submits search with no query' do
    visit recipes_path
    click_button 'Search'
    
    expect(page).to have_content('No recipes found. Try a different search!')
  end
end
