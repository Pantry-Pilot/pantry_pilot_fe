class Recipe
  attr_reader :id, :title, :image, :summary, :ingredients, :instructions

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @image = data[:image]
    @summary = data[:summary] || ""
    @instructions = data[:instructions] || ""
    # require 'pry';binding.pry
    @ingredients = data[:ingredients] ? data[:ingredients].map do |ingredient_data|
      Ingredient.new(ingredient_data)
    end : []
  end
end
