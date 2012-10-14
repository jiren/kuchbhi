# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = ['Four Wheeler', 'Two Wheeler', 'Home', 'Accessories', 'Real Estate']

puts "Creating categories ...."
categories.each {|c| Category.create!(:name => c) }
puts "Done!!!!!"

unless Rails.env.test?
addresses = [
  {'address' => "10110 W Hallett Rd, Spokane, WA, 99224", 'locality' => 'Spokane', 'country' => 'United States', 
                                              'lat' => '47.5943644', 'lng' => '-117.45999719999998'}, 

  {'address' => "13103 E Mansfield Ave, Spokane, WA, 99216", 'locality' => 'Spokane', 'country' => 'United States',  
                                              'lat' => '47.678237', 'lng' => '-117.22832299999999'},

  {'address' => "S Halsted St, Chicago, IL 60643, USA", 'locality' => 'Chicago', 'country' => 'United States',
                                              'lat' => '41.692927', 'lng' => '-87.64894199999998'},

  {'address' => "10310 E Montgomery Dr, Spokane, WA, 99206", 'locality' => 'Spokane', 'country' => 'United States',
                                                'lat' => '47.679067', 'lng' => '-117.26441899999998'}, 

  {'address' => "1729 N Halsted St, Chicago, 60614", 'locality' => 'Chicago', 'country' => 'United States',
                                          'lat' => '41.913703', 'lng' => '-87.64813579999998'},

  {'address' => "11604 E Indiana Rd, Spokane, WA, 99206", 'locality' => 'Spokane', 'country' => 'United States',
                                              'lat' => '47.674715', 'lng' => '-117.248922'},

  {'address' => "N Canon Dr, Chicago, IL, 60614", 'locality' => 'Chicago', 'country' => 'United States',
                                        'lat' => '41.9233646', 'lng' => '-87.63251550000001'},

  {'address' => "101 W 8th Ave, Spokane, WA, 99204", 'locality' => 'Spokane', 'country' => 'United States', 
                                          'lat' => '47.649361', 'lng' => '-117.411944'},

  {'address' => "1116 W Riverside Ave, Spokane, WA, 99201", 'locality' => 'Spokane', 'country' => 'United States', 
                                              'lat' => '47.658732', 'lng' => '-117.428832'},

  {'address' => "12510 E Sprague Ave, Spokane, WA, 99216", 'locality' => 'Spokane', 'country' => 'United States', 
                                              'lat' => '47.6570881', 'lng' => '-117.23627349999998'}, 

  {'addresss' => "1212 E Front Ave, Spokane, WA, 99202", 'locality' => 'Spokane', 'country' => 'United States', 
                                              'lat' => '47.6604131', 'lng' => '-117.39255200000002'}, 

  {'address' => "1114 N Ralph St, Spokane, WA, 99202", 'locality' => 'Spokane', 'country' =>  'United States', 
                                            'lat' => '47.669618', 'lng' => '-117.36098500000003'},

  {'address' => "120 N Ralph St, Spokane, WA, 99202", 'locality' => 'Spokane', 'country' => 'United States', 
                                            'lat' => '47.658717', 'lng' => '-117.361399'}]

two_wheeler = ["http://worldviewbikes.com/wp-content/uploads/2011/12/Yamaha-YZF-R15-Stand-View.jpg", 
    "http://4.bp.blogspot.com/_JHw9cVbCi-g/TSvYDHbJuZI/AAAAAAAAAEs/ZMT0fqSOT3M/s1600/yamaha_r15_bike_blue_color.png"]

four_wheeler = ["http://carimg.sulekha.com/audi/audi-a8l/thumbnailfull/audi-a8l-car-stills-2011-2-22-5-43-10.jpg", 
                "http://concept.carwallpapers.ru/wp/audi/2010-quattro/Concept-Car-Audi-quattro-2010-1280x800-003.jpg"]

home = ["http://rollandsafeandlock.com/service/images/first-home.jpeg", 
        "http://media-cdn.tripadvisor.com/media/photo-s/01/8b/3b/23/luxury-home-stays.jpg"]

accessories = ["http://www.blogcdn.com/www.engadget.com/media/2010/01/2010-01-27-ipad-accessories-5.png", 
              "http://www.forevergeek.com/wp-content/uploads/2010/03/ipad_accessory1.jpg"]

real_estate = ["http://www.disharigroup.com/images/estate.jpg", 
  "http://www.fopple.com/wp-content/uploads/2010/01/elegant-sofa-for-real-estate-large-livingroom-design.jpg"]

categories = Category.all
address_count = addresses.count

puts "Creating ads....."
50.times do 
  user = User.create!(name: Faker::Name.first_name, email: Faker::Internet.email, phone_number: Faker::PhoneNumber.cell_phone)
  c = categories[rand(5)]
  address = addresses[rand(address_count)]

  ad = Ad.new(description: Faker::Lorem.paragraph, price: rand(1000000), 
           address: address['address'], locality: address['locality'], country: address['country'],
           lat: address['lat'], lng: address['lng'], published: true,
           phone_number: Faker::PhoneNumber.cell_phone)

  ad.user = user
  ad.category = c

  i = Image.new
  j = Image.new
  case c.name
  when 'Two Wheeler'
    i.image = open(two_wheeler[0])
    ad.images << i
    j.image = open(two_wheeler[1])
    ad.images << j
  when "Four Wheeler"
    i.image = open(four_wheeler[0])
    ad.images << i
    j.image = open(four_wheeler[1])
    ad.images << j
  when "Home" 
    i.image = open(home[0])
    ad.images << i
    j.image = open(home[1])
    ad.images << j
  when "Accessories"
    i.image = open(accessories[0])
    ad.images << i
    j.image = open(accessories[1])
    ad.images << j
  when "Real Estate"
    i.image = open(real_estate[0])
    ad.images << i
    j.image = open(real_estate[1])
    ad.images << j
  end
  ad.save
end
puts "Done!!!!"
end
