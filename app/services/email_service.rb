class EmailService

  def send_recipe(recipient, recipe_id, sender_id)
    response = conn.post("/api/v1/email_recipe") do |req|
      req.body = { recipient_email: recipient, recipe_id: recipe_id, sender_id: sender_id }

    end
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