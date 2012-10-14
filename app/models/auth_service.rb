class AuthService
  include Mongoid::Document

  field :provider
  field :uid
  field :name
  field :screen_name
  field :image_url

  belogns_to :user
end
