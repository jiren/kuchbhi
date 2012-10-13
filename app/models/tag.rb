class Tag
  include Mongoid::Document

  field :name, type: String

  has_many :classifieds
end
