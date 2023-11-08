class AvatarsFacade
  def add_image_to_recipe(avatar_data)
    response = AvatarsService.new.add_image_to_recipe(avatar_data)
    response_body = JSON.parse(response.body, symbolize_names: true)
    if response.status == 200
      {
        status: response.status,
        notice: response_body[:notice]
      }
    else
      {
        status: response.status,
        error: response_body[:error]
      }
    end
  end
end