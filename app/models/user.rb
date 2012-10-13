class User
  include Mongoid::Document

  field :name, type: String
  field :email, type: String
  field :twitter, type: String
  field :facebook, type: String
  field :phone_number, type: String
end
