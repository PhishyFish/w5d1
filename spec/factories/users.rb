FactoryBot.define do
  factory :user do
    username { Faker::Cat.name }
    password { 'password' }
  end
end
