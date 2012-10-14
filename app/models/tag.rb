class Tag
  include Mongoid::Document

  field :name, type: String

  belongs_to :ad

  validates :name, presence: true
end
