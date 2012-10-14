# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do |u|
    u.sequence(:name) { Faker::Name.first_name }
    u.sequence(:email) { Faker::Internet.email }
  end
end
