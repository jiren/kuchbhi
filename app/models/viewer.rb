class Viewer
  include Mongoid::Document

  field :interested, type: Boolean, default: false
  
  belongs_to :user
  belongs_to :ad

  validates :user, :ad, presence: true
end
