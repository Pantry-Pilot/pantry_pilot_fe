class SessionsFacade
  def self.user_login(email, password)
    response = SessionsService.new.user_login(email, password)
    response_body = JSON.parse(response.body, symbolize_names: true)
    if response.status == 201
      {
        status: response.status,
        user_id: response_body[:data][:id]
      }
    else
      {
        status: response.status,
        error: response_body[:error]
      }
    end
  end
end