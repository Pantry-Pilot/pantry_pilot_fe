require 'rails_helper'

RSpec.describe Ingredient do
  let(:ingredient_data) do
    {
      name: 'Chicken',
      amount: 1.5,
      unit: 'lb'
    }
  end

  subject(:ingredient) { described_class.new(ingredient_data) }

  describe 'attributes' do
    it 'has a name' do
      expect(ingredient.name).to eq('Chicken')
    end

    it 'has an amount' do
      expect(ingredient.amount).to eq(1.5)
    end

    it 'has a unit' do
      expect(ingredient.unit).to eq('lb')
    end
  end
end
