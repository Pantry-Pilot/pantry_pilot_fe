class RecipesService
  def search(recipe_parameters)
    response = conn.get("/api/v1/recipes/search") do |req|
      if recipe_parameters[:query].present?
        req.params['query'] = recipe_parameters[:query]
      end
      if recipe_parameters[:diets].present?
        req.params['diet'] = array_to_csv(recipe_parameters[:diets])
      end
      if recipe_parameters[:intolerances].present?
        req.params['intolerances'] = array_to_csv(recipe_parameters['intolerance'])
      end
      if recipe_parameters[:include].present?
        req.params['includeIngredients'] = recipe_parameters[:include]
      end
      if recipe_parameters[:exclude].present?
        req.params['excludeIngredients'] = recipe_parameters[:exclude]
      end
    end
    parse_response(response)
  end

  def array_to_csv(array)
    csv_string = ""
    array.each do |element|
      csv_string += element
      if element != array.last
        csv_string += ","
      end
    end
    csv_string
  end
  
  def find(id)
    response = conn.get("/api/v1/recipes/#{id}")
    parse_response(response)
  end

  def store_recipe(data)
    conn.post("/api/v1/add_recipe") do |req|
      req.body = data.to_json
    end
  end

  def remove_recipe(id)
    conn.delete("/api/v1/delete_recipe") do |req|
      req.body = {id: id}.to_json
    end
  end

  private

  def conn
    Faraday.new(url: Rails.configuration.x.sessions_service_url) do |config|
      config.request :json
      config.adapter Faraday.default_adapter  
    end
  end

  def parse_response(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end