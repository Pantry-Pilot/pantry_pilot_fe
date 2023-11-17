class IngredientsService

  def add_user_ingredient(ingredient_data)
    conn.post("/api/v1/add_ingredient") do |req|
      req.body = ingredient_data.to_json
    end
  end

  def get_user_ingredients(user)
    conn.get("/api/v1/user_ingredients/#{user}")
  end

  def delete_ingredient(ingredient_id)
    conn.delete("/api/v1/delete_ingredient/#{ingredient_id}")
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