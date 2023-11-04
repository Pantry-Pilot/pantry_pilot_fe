class Ingredient
  attr_reader :name, :amount, :unit

  def initialize(data)
    @name = data[:name]
    @amount = data[:amount]
    @unit = data[:unit]
  end
  
  def attributes
    { name: name, amount: amount, unit: unit }
  end
end
