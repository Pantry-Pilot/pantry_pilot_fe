class UserRecipe
  attr_reader :id, :recipe_id, :title, :image#, :image_upload

  def initialize(data)
    @id = data[:id]
    @recipe_id = data[:attributes][:recipe_id]
    @title = data[:attributes][:title]
    @image = data[:attributes][:image]
    # @image_upload = data[:attributes][:image_upload] || ""
  end
end