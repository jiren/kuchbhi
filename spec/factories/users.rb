# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do 
    sequence(:name) { Faker::Name.first_name }
    sequence(:email) { Faker::Internet.email }
    sequence(:phone_number) { rand(1000000000000) }
    address "13103 E Mansfield Ave, Spokane, WA, 99216"
  end
end
