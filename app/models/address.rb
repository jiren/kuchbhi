class Address
  include Mongoid::Document

  field :address, type: String
  field :locality, type: String
  field :country, type: String
  field :lat, type: Float 
  field :lng, type: Float

  validates :address, :locality, :country, :lat, :lng, presence: true
end
