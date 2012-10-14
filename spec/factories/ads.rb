# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ad do |a|
    a.sequence(:description) { Faker::Lorem.paragraph }
    a.price 10000
    a.address "10110 W Hallett Rd, Spokane, WA, 99224"
    a.locality 'Spokane'
    a.country 'United States'
    a.lat '41.913703'
    a.lng '-117.45999719999998'
    a.category Category.first || FactoryGirl.create(:category)
    a.association :user
  end
end
