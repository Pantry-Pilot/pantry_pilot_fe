require 'rails_helper'

describe "User Account Creation", type: :feature do
  it "allows a user to create an account successfully" do
    
    visit root_path

    click_button "Create an Account"

    expect(current_path).to eq(new_user_path)

    fill_in "Name", with: "John Doe"
    fill_in "Email", with: "johndoe@example.com"
    fill_in "Password", with: "securepassword"
    fill_in "Confirm Password", with: "securepassword"

    # click_button "Make My Account"

    # expect(current_path).to eq(login_path)

    # expect(page).to have_content("You have successfully created an account. Please log in.")
  end

  # it "displays error messages for invalid account creation" do
    
  #   visit root_path

  #   click_on "Create Account"

  #   expect(current_path).to eq(new_user_path)

  #   fill_in "Name", with: "" # Invalid, as Name is required
  #   fill_in "Email", with: "invalid_email" # Invalid email format
  #   fill_in "Password", with: "password123"
  #   fill_in "Confirm Password", with: "password456" # Passwords do not match

  #   click_button "Make My Account"

  #   expect(current_path).to eq(new_user_path)

  #   expect(page).to have_content("Name can't be blank")
  #   expect(page).to have_content("Email is invalid")
  #   expect(page).to have_content("Password confirmation doesn't match Password")
  # end
end
