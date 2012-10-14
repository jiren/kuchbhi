class User
  include Mongoid::Document

  field :email              
  field :name
  field :phone_number
  field :address

  has_many :ads, dependent: :destroy
  has_many :ad_views, class_name: 'Viewer', dependent: :destroy
  has_many :auth_services, autosave: true,  dependent: :destroy

  def apply_omniauth(omniauth)
    self.email = omniauth[:email] if self.email.blank?
    self.name = omniauth[:name]

    self.auth_services.build(:provider => omniauth[:provider],
                        :uid => omniauth[:uid], 
                        :name => omniauth[:name], 
                        :email => omniauth[:email], 
                        :screen_name => omniauth[:screen_name], 
                        :image_url => omniauth[:image_url])
  end

  validates :name, :email, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
end
