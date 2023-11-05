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
end
