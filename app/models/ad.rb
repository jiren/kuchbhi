class Ad
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Search

  attr_accessible :tag_list, :description, :price, :address, :lat, :lng, :category, :images, :phone_number
  
  field :description
  field :phone_number
  field :price, type: Float
  field :hits, type: Integer, default: 0
  field :published, type: Boolean, default: false

  field :address, type: String
  field :locality, type: String
  field :country, type: String
  field :lat, type: Float 
  field :lng, type: Float

  belongs_to :category
  belongs_to :user

  has_many :images, autosave: true
  has_many :tags, autosave: true
  has_many :views, class_name: 'Viewer', dependent: :destroy

  accepts_nested_attributes_for :images, :allow_destroy => true, :reject_if => :all_blank

  validates :description, :price, presence: true
  validates_numericality_of :price, greater_than: 0

  search_in :description, :category => :name, :tags => :name

  def as_json(options = {})
    options ||= {}
    options ||= {}
    options[:except] = [:user_id, :updated_at, :_keywords]
    options[:methods] = [:image_urls, :thumbnail]
    options[:include] = [:category]
    super
  end

  def image_urls
    self.images.limit(2).collect{|i| [i.image.url(:small), i.image.url]}
  end

  def tag_list
    self.tags.collect(&:name).join(", ")
  end

  def tag_list=(val)
    self.tags = val.split(',').collect do |i|
      self.tags.where(:name => i.strip).first || self.tags.build(:name => i.strip)
    end
  end

end
