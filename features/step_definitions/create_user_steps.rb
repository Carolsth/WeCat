Given("I am on the registration page") do
  visit new_user_registration_path
end

When('I fill in {string} with {string}') do |field, value|
  fill_in field, with: value
end
