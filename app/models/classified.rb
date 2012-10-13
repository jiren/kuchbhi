class Classified
  include Mongoid::Document
  
  field :description, type: String
  field :price, type: Integer

  belongs_to :category
  belongs_to :user
  has_many :images
  has_many :tags
  has_one :address
end
