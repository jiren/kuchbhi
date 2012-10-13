class User
  include Mongoid::Document

  field :name, type: String
  field :email, type: String
  field :twitter, type: String
  field :facebook, type: String
  field :phone_number, type: String
  field :address, type: String

  has_many :ads, dependent: :destroy
  has_many :ad_views, class_name: 'Viewer', dependent: :destroy

  validates :name, :email, presence: true
  validates_format_of :email, with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
end
