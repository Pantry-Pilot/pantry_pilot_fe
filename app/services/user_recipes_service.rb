class UserRecipesService
  def get_user_recipes(user_id)
    response = conn.get("/api/v1/user_recipes/#{user_id}")
    parse_response(response)
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