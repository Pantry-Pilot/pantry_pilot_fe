require 'rails_helper'

RSpec.describe Recipe do
  describe 'initialization' do
    let(:ingredient_data) do
      [
        { id: 1, name: 'Chicken', amount: '2 pieces', unit: 'each' },
        { id: 2, name: 'Salt', amount: '1', unit: 'tsp' }
      ]
    end

    let(:recipe_data) do
      {
        id: '123',
        title: 'Grilled Chicken',
        image: 'grilled_chicken.jpg',
        summary: 'A delicious grilled chicken recipe.',
        instructions: 'Grill the chicken for 10 minutes.',
        ingredients: ingredient_data
      }
    end

    subject(:recipe) { described_class.new(recipe_data) }

    it 'sets the id' do
      expect(recipe.id).to eq('123')
    end

    it 'sets the title' do
      expect(recipe.title).to eq('Grilled Chicken')
    end

    it 'sets the image' do
      expect(recipe.image).to eq('grilled_chicken.jpg')
    end

    it 'sets the summary with a default value' do
      expect(recipe.summary).to eq('A delicious grilled chicken recipe.')
    end

    it 'sets the instructions with a default value' do
      expect(recipe.instructions).to eq('Grill the chicken for 10 minutes.')
    end

    it 'creates Ingredient objects for each item in the ingredients array' do
      expect(recipe.ingredients.length).to eq(2)
      expect(recipe.ingredients.first).to be_a(Ingredient)
      expect(recipe.ingredients.first.name).to eq('Chicken')
    end

    context 'when summary is missing' do
      before { recipe_data.delete(:summary) }

      it 'sets the summary to an empty string' do
        expect(recipe.summary).to eq('')
      end
    end

    context 'when instructions are missing' do
      before { recipe_data.delete(:instructions) }

      it 'sets the instructions to an empty string' do
        expect(recipe.instructions).to eq('')
      end
    end

    context 'when ingredients are missing' do
      before { recipe_data.delete(:ingredients) }

      it 'sets ingredients to an empty array' do
        expect(recipe.ingredients).to eq([])
      end
    end
  end
end
