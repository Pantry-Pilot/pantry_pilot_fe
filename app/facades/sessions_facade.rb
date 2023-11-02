class SessionsFacade
  def self.user_login(email, password)
    response = SessionsService.new.user_login(email, password)
    response_body = JSON.parse(response.body, symbolize_names: true)
    {
      status: response.status,
      user_id: response_body[:data][:id]
    }
  end
end
