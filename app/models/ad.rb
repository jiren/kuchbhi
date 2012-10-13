class Ad
  include Mongoid::Document
  
  field :description, type: String
  field :price, type: Float
  field :hits, type: Integer

  field :address, type: String
  field :locality, type: String
  field :country, type: String
  field :lat, type: Float 
  field :lng, type: Float

  belongs_to :category
  belongs_to :user

  has_many :images, dependent: :destroy
  has_many :tags
  has_many :views, class_name: 'Viewer', dependent: :destroy

  validates :description, :price, :user, :category, presence: true
  validates_numericality_of :price, greater_than: 0
end
