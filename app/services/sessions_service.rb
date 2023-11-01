class SessionsService
  BASE_URL = "http://localhost:5000"

  def conn
    Faraday.new(url: BASE_URL) do |config|
      config.request :json  # Automatically set Content-Type and encode request body as JSON
      config.response :json  # Automatically parse JSON responses
      config.adapter Faraday.default_adapter  # Use the default HTTP adapter
    end
  end
  
  def user_login(email, password)
    conn.post("/api/v1/login") do |request|
      request.headers['Content-Type'] = 'application/json'
      request.body = { email: email, password: password }
    end
  end
end