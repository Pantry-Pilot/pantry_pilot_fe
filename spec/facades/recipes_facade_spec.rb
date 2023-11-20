require 'rails_helper'

RSpec.describe RecipeFacade do
  describe '#search', :vcr do
    it 'returns a list of recipes' do
      search_term = {query: 'chicken'}
      recipes = RecipeFacade.search(search_term)
      expect(recipes).to be_an(Array)
      expect(recipes.first).to be_a(Recipe)
    end
  end

  describe '#find', :vcr do
    it 'returns a recipe' do
      id = '1'
      recipe = RecipeFacade.find(id)
      expect(recipe).to be_a(Recipe)
    end
  end
end
