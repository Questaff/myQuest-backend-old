FactoryBot.define do
  factory :user do
    username { Faker::Name.unique.name }
    email { Faker::Internet.email }
    first_name { Faker::Name.name }
    last_name { Faker::Name.name }
    password_digest { 'password' }
    phone_number { Faker::PhoneNumber }
  end
end