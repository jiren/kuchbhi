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
    self.email = omniauth['user_info']['email'] if self.email.blank?
    self.name = omniauth['user_info']['name']

    user.auth_services.build(:provider => @authhash[:provider], 
                        :uid => authhash[:uid], 
                        :name => authhash[:name], 
                        :email => authhash[:email], 
                        :screen_name => authhash[:screen_name], 
                        :image_url => authhash[:image_url])
  end

  validates :name, :email, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
end
