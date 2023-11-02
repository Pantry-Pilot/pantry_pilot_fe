class SessionsFacade
  def self.user_login(email, password)
    response = SessionsService.new.user_login(email, password)
    
    {
      status: response.status
    }
  end
end