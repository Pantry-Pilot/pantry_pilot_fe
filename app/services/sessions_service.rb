class SessionsService
  BASE_URL = "http://localhost:5000"

  def conn
    Faraday.new(url: BASE_URL) do |config|
      config.request :json 
      config.adapter Faraday.default_adapter 
    end
  end
  
  def user_login(email, password)
    conn.post("/api/v1/login") do |request|
      request.headers['Content-Type'] = 'application/json'
      request.body = { email: email, password: password }
    end
  end
end