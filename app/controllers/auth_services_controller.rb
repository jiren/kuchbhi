class AuthServicesController < ApplicationController
  before_filter :authenticate_user!, :except => [:create, :signin, :failure]
  before_filter :validate_callback!, :only => [:create]

  protect_from_forgery :except => :create

  # callback: success
  # This handles signing in and adding an authentication via twitter
  def create
    auth = AuthService.where(:provider => @authhash[:provider], :uid => @authhash[:uid]).first

    if auth
      # signin existing user
      session[:user_id], session[:service_id] = auth.user_id, auth.id
      flash[:notice] = 'Signed in successfully via ' + @authhash[:provider].capitalize + '.'
    else
      # find or create user
      user = User.where(:email => @authhash[:email]).first || User.new(:email => @authhash[:email])
      user = user.apply_omniauth(@authhash)

      if user.save!
        session[:user_id], session[:service_id] = user.id, user.auth_services.where(:provider => @authhash[:provider]).first.id
      end
      flash[:notice] = 'Your account has been created and you have been signed in!'
    end
    unless session[:user_id]
      reset_session
      flash[:error] = 'There was an error while creating your account from which we were not able to recover.'
    end

    redirect_to root_url
  end

  def signout 
    if current_user
      reset_session
      flash[:notice] = 'You have been signed out!'
    end  
    redirect_to root_url
  end

  def failure
    flash[:error] = 'There was an error at the remote authentication service. You have not been signed in.'
    redirect_to root_url
  end

  private
  def validate_callback!
    if user_signed_in?
      flash[:notice] = 'You are already signed In'
      redirect_to root_url and return
    end
    omniauth = request.env['omniauth.auth']
    # continue only if hash and parameter exist
    if !params[:service].match(/facebook|twitter/) || omniauth.blank?
      flash[:error] ='Invalid Request!'
      redirect_to root_url and return
    elsif params[:service] == 'twitter'
      extract_twitter(omniauth)
    elsif params[:service] == 'facebook'
      extract_facebook(omniauth)
    end
  end

  def extract_twitter(omniauth)
    @authhash = { name: omniauth['info']['name'], uid: omniauth['uid'].to_s, provider: omniauth['provider'], screen_name: omniauth['info']['nickname'], email: omniauth['info']['email'], image_url: omniauth['info']['image'] }
    
    if @authhash[:uid].blank? || @authhash[:provider].blank?
      flash[:error] = 'Error while authenticating via Twitter. The service did not return valid data.'
      redirect_to root_url and return
    end
  end

  def extract_facebook(omniauth)
    @authhash = { name: omniauth['info']['name'], uid: omniauth['uid'].to_s, provider: omniauth['provider'], screen_name: omniauth['info']['nickname'], email: omniauth['info']['email'], image_url: omniauth['info']['image'] }
    if @authhash[:uid].blank? || @authhash[:provider].blank?
      flash[:error] = 'Error while authenticating via Facebook. The service did not return valid data.'
      redirect_to root_url and return
    end
  end
end
