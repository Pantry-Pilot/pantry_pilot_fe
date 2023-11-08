class UsersFacade
  
  def self.register_user(name, email, password)
    response = UsersService.new.register_user(name, email, password)
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

  def get_user(user_id)
    response = UsersService.new.get_user_from_db(user_id)
    data = JSON.parse(response.body, symbolize_names: true)
    User.new(data)
    # require 'pry';binding.pry
  end

  def oauth_verification(email)
    response = UsersService.new.oauth_verification(email)
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
