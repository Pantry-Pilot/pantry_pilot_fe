class SessionsService
  # BASE_URL = "http://localhost:5000"
  # Rails.configuration.x.sessions_service_url

  def conn
    Faraday.new(url: Rails.configuration.x.sessions_service_url) do |config|
      config.request :json 
      config.adapter Faraday.default_adapter 
    end
  end
  
  def user_login(email, password)
    # require 'pry';binding.pry
    conn.post("/api/v1/login") do |request|
      request.headers['Content-Type'] = 'application/json'
      request.body = { email: email, password: password }
    end
  end
end