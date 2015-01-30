class AuthController < ApplicationController

  def index
  end

  def login
    @logged_user = User.find_by(login: params[:login]).try(:authenticate, params[:password])

     if @logged_user
       session[:logged_user] = @logged_user.attributes
       redirect_to articles_path
     else
       redirect_to auth_login_path
     end
  end

  def logout
    reset_session
    redirect_to auth_login_path
  end

end
