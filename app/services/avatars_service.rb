require 'faraday/multipart'

class AvatarsService
  def add_image_to_recipe(avatar_data)
    payload = {
      'recipe[id]': avatar_data[:id],
      'recipe[avatar]': Faraday::UploadIO.new(avatar_data[:avatar].tempfile, avatar_data[:avatar].content_type, avatar_data[:avatar].original_filename)
    }

    conn.post("/api/v1/add_image", payload)
  end

  def remove_avatar_from_recipe(recipe_id)
    conn.delete("/api/v1/delete_image") do |req|
      req.body = { id: recipe_id }
    end
  end
  
  private

  def conn
    Faraday.new(url: Rails.configuration.x.sessions_service_url) do |config|
      config.request :multipart
      config.request :url_encoded
      config.adapter Faraday.default_adapter
    end
  end
end