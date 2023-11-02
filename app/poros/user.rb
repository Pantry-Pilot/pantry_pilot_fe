class User
  attr_reader :name, :email

  def initialize(data)
    @name = data[:data][:attributes][:name]
    @email = data[:data][:attributes][:email]
  end
end