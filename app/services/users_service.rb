class UsersService
  BASE_URL = "http://localhost:5000"

  def conn
    Faraday.new(url: BASE_URL) do |config|
      config.request :json  
      config.adapter Faraday.default_adapter  
    end
  end

  def register_user(name, email, password)
    conn.post("/api/v1/register") do |request|
      request.headers['Content-Type'] = 'application/json'
      request.body = { name: name, email: email, password: password }
    end
  end

  def get_user_from_db(user_id)
    conn.get("/api/v1/users/#{user_id}")
  end
end