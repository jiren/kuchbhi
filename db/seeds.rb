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

addresses = [
  "10110 W Hallett Rd, Spokane, WA, 99224" => {'locality' => 'Spokane', 'country' => 'United States', 
                                              'lat' => '47.5943644', 'lng' => '-117.45999719999998'}, 

  "13103 E Mansfield Ave, Spokane, WA, 99216" => {'locality' => 'Spokane', 'country' => 'United States',  
                                                  'lat' => '47.678237', 'lng' => '-117.22832299999999'},

  "S Halsted St, Chicago, IL 60643, USA" => {'locality' => 'Chicago', 'country' => 'United States'
                                              'lat' => '41.692927', 'lng' => '-87.64894199999998'},

  "10310 E Montgomery Dr, Spokane, WA, 99206" => {'locality' => 'Spokane', 'country' => 'United States',
                                                'lat' => '47.679067', 'lng' => '-117.26441899999998'}, 

  "1729 N Halsted St, Chicago, 60614" => {'locality' => 'Chicago', 'country' => 'United States',
                                          'lat' => '41.913703', 'lng' => '-87.64813579999998'},

  "11604 E Indiana Rd, Spokane, WA, 99206" => {'locality' => 'Spokane', 'country' => 'United States',
                                              'lat' => '47.674715', 'lng' => '-117.248922'},

  "N Canon Dr, Chicago, IL, 60614" => {'locality' => 'Chicago', 'country' => 'United States',
                                        'lat' => '41.9233646', 'lng' => '-87.63251550000001'},

  "101 W 8th Ave, Spokane, WA, 99204" => {'locality' => 'Spokane', 'country' => 'United States', 
                                          'lat' => '47.649361', 'lng' => '-117.411944'},

  "1116 W Riverside Ave, Spokane, WA, 99201" => {'locality' => 'Spokane', 'country' => 'United States', 
                                              'lat' => '47.658732', 'lng' => '-117.428832'},

  "12510 E Sprague Ave, Spokane, WA, 99216" => {'locality' => 'Spokane', 'country' => 'United States', 
                                              'lat' => '47.6570881', 'lng' => '-117.23627349999998'}, 

  "1212 E Front Ave, Spokane, WA, 99202" => {'locality' => 'Spokane', 'country' => 'United States', 
                                              'lat' => '47.6604131', 'lng' => '-117.39255200000002'}, 

  "1114 N Ralph St, Spokane, WA, 99202" => {'locality' => 'Spokane', 'country' =>  'United States', 
                                            'lat' => '47.669618', 'lng' => '-117.36098500000003'},

  "120 N Ralph St, Spokane, WA, 99202" => {'locality' => 'Spokane', 'country' => 'United States', 
                                            'lat' => '47.658717', 'lng' => '-117.361399'}]
