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
    expect(page).to have_unchecked_field(:gluten_free)
    expect(page).to have_unchecked_field(:ketogenic)
    expect(page).to have_unchecked_field(:vegetarian)
    expect(page).to have_unchecked_field(:lacto_vegetarian)
    expect(page).to have_unchecked_field(:ovo_vegetarian)
    expect(page).to have_unchecked_field(:vegan)
    expect(page).to have_unchecked_field(:pescetarian)
    expect(page).to have_unchecked_field(:paleo)
    expect(page).to have_unchecked_field(:primal)
    expect(page).to have_unchecked_field(:low_fodmap)
    expect(page).to have_unchecked_field(:whole30)

    expect(page).to have_content("Intolerances")
    expect(page).to have_unchecked_field(:dairy)
    expect(page).to have_unchecked_field(:egg)
    expect(page).to have_unchecked_field(:gluten)
    expect(page).to have_unchecked_field(:grain)
    expect(page).to have_unchecked_field(:peanut)
    expect(page).to have_unchecked_field(:seafood)
    expect(page).to have_unchecked_field(:sesame)
    expect(page).to have_unchecked_field(:shellfish)
    expect(page).to have_unchecked_field(:soy)
    expect(page).to have_unchecked_field(:sulfite)
    expect(page).to have_unchecked_field(:tree_nut)
    expect(page).to have_unchecked_field(:wheat)

    expect(page).to have_content("Include Ingredient")
    expect(page).to have_field(:include_ingredient)

    expect(page).to have_content("Exclude Ingredient")
    expect(page).to have_field(:exclude_ingredient)

    fill_in :query, with: "steak"
    check :dairy
    check :seafood
    click_on "Search"

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
