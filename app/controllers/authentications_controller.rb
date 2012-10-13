class AuthenticationsController < ApplicationController
  def index
    @authentications = current_user.authentications if current_user
  end

  def new
    @authentication = Authentication.new
  end

  def create
    omniauth = request.env["omniauth.auth"]
    #authentication = Authentication.find_by_provider_and_uid(omniauth[:provider], omniauth[:uid])
    authentication = Authentication.where(provider: omniauth['provider'], uid: omniauth['uid']).first
    if authentication
      user = authentication.user
      user.apply_omniauth(omniauth)
      user.save
      flash[:notice] = "Signed in successfully."
      sign_in_and_redirect(:user, user)
    elsif current_user
      current_user.authentications.create!(provider: omniauth['provider'], uid: omniauth['uid'])
      flash[:notice] = "Authentication successful."
      redirect_to authentications_url
    else
      user = User.new
      user.apply_omniauth(omniauth)
      if user.save
        flash[:notice] = "Signed in successfully."
        sign_in_and_redirect(:user, user)
      else
        session[:omniauth] = omniauth.except('extra')
        redirect_to new_user_registration_url
      end
    end
  end

  def failure
    flash[:notice] = params[:message]
    redirect_to root_path
  end

  def destroy
    @authentication = Authentication.find(params[:id])
    @authentication.destroy

    respond_to do |format|
      format.html { redirect_to(authentications_url) }
      format.xml  { head :ok }
    end
  end

  protected

  # This is necessary since Rails 3.0.4
  # See https://github.com/intridea/omniauth/issues/185
  # and http://www.arailsdemo.com/posts/44
  def handle_unverified_request
    true
  end

end
