class UsersFacade
  def self.register_user(name, email, password)
    response = UsersService.new.register_user(name, email, password)
    {
      status: response.status
    }
  end
end