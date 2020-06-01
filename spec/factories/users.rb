FactoryBot.define do
  factory :user do
    username { Faker::Name.unique.name }
    email { Faker::Internet.email }
    first_name { Faker::Name.name }
    last_name { Faker::Name.name }
    password { 'password' }
    password_confirmation { 'password' }
    phone_number { Faker::Base.numerify('+337########') }
  end
end