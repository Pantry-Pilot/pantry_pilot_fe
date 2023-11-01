class UsersService
  BASE_URL = "http://localhost:5000"

  def conn
    Faraday.new(url: BASE_URL) do |config|
      config.request :json  # Automatically set Content-Type and encode request body as JSON
      config.response :json  # Automatically parse JSON responses
      config.adapter Faraday.default_adapter  # Use the default HTTP adapter
    end
  end

  def register_user(name, email, password)
    conn.post("/api/v1/register") do |request|
      request.headers['Content-Type'] = 'application/json'
      request.body = { name: name, email: email, password: password }
    end
  end
end