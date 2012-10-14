class AuthService
  include Mongoid::Document

  field :provider
  field :uid
  field :name
  field :screen_name
  field :image_url

  belongs_to :user
end
