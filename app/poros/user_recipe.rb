class UserRecipe
  attr_reader :id, :recipe_id, :title, :image#, :avatar

  def initialize(data)
    @id = data[:id]
    @recipe_id = data[:attributes][:recipe_id]
    @title = data[:attributes][:title]
    @image = data[:attributes][:image]
    #@avatar = data[:attributes][:avatar]
  end
end