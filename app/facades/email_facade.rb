class EmailFacade
  def email_recipe(recipient_email, recipe_id, sender_id)
    response = EmailService.new.send_recipe(recipient_email, recipe_id, sender_id)
    # require 'pry';binding.pry
    {
      status: response[:status]
    }
  end
end