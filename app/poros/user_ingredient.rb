class UserIngredient
  attr_reader :id, :name, :quantity, :exp_date

  def initialize(ingredient_data)
    @id = ingredient_data[:id]
    @name = ingredient_data[:attributes][:name]
    @quantity = ingredient_data[:attributes][:quantity]
    @exp_date = ingredient_data[:attributes][:exp_date]
  end
end