class UsersFacade
  
  def self.register_user(name, email, password)
    response = UsersService.new.register_user(name, email, password)
    response_body = JSON.parse(response.body, symbolize_names: true)
    {
      status: response.status,
      user_id: response_body[:data][:id]
    }
  end

  def get_user(user_id)
    response = UsersService.new.get_user_from_db(user_id)
    data = JSON.parse(response.body, symbolize_names: true)
    User.new(data)
  end
end