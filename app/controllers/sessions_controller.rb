class SessionsController < ApplicationController

  def index
    @user = User.find(session[:user_id])
  end


  def create
    auth_hash = request.env['omniauth.auth']

    if auth_hash[:uid]

      @user = User.find_by(uid: auth_hash[:uid], provider: 'github')

      flash[:status] = :success
      flash[:result_text] = "Successfully logged in as existing user #{@user.username}"

      if @user.nil?
        @user = User.info_from_github(auth_hash)


        flash[:status] = :success
        flash[:result_text] = "Successfully created new user #{@user.username} with ID #{@user.id}"
      end

      session[:user_id] = @user.id
    else
      flash[:status] = :failure
      flash[:result_text] = "Could not log in"
      flash[:messages] = @user.errors.messages
    end

    redirect_to root_path
  end

  def logout
    if session[:user_id]
      session[:user_id] = nil
      flash[:result_text] = "Successfully logged out"
      redirect_to root_path
    end
  end


  def destroy
    session[:user_id] = nil
    flash[:success] = "Successfully logged out!"

    redirect_to root_path
  end

end
