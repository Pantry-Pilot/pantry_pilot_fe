require 'rails_helper'

RSpec.describe RecipesService, :vcr do
  let(:service) { described_class.new }

  describe '#search' do
    query = { query: 'chicken' }

    it 'makes a GET request to the search endpoint' do
      response = service.search(query)
      expect(response).to be_a Hash
    end
  end

  describe '#find' do
    let(:recipe_id) { '123' }

    it 'makes a GET request to the find endpoint' do
      response = service.find(recipe_id)
      expect(response).to be_a Hash
    end
  end
end
