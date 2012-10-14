class Image
  include Mongoid::Document
  include Mongoid::Paperclip

  has_mongoid_attached_file :image,
    :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
    :url => "/system/:attachment/:id/:style/:filename",
    :styles => {
      :small    => ['90x90#', :jpg],
    }

  belongs_to :ad
end
