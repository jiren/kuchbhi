class Image
  include Mongoid::Document
  include Mongoid::Paperclip

  has_mongoid_attached_file :image,
    :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
    :url => "/system/:attachment/:id/:style/:filename"

  field :name, type: String
end
