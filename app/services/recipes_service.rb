class RecipesService
  def search(query)
    response = conn.get("/api/v1/recipes/search") do |req|
      req.params['query'] = query
    end
    parse_response(response)
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