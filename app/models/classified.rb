class Classified
  include Mongoid::Document
  
  field :description, type: String
  field :price, type: Interger
end
