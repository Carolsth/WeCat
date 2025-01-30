FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    username { Faker::Internet.username }
    phone { Faker::PhoneNumber.cell_phone_in_e164.gsub(/\D/, '')[0..10] }
    password { 'password123' }
    password_confirmation { 'password123' }
  end
end
