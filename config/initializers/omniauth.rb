
OMNIAUTH_CONFIG = YAML.load_file(Rails.root.to_s + '/config/omniauth.yml')[Rails.env] 

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter,  OMNIAUTH_CONFIG['twitter_key'], OMNIAUTH_CONFIG['twitter_secret']
  provider :facebook, OMNIAUTH_CONFIG['facebook_key'], OMNIAUTH_CONFIG['facebook_secret']
end
