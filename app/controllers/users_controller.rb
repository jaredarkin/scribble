class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @comments = @user.comments.all
    @posts = Post.all
  end

  def signin
    if params[:username].strip == ""
      message = "You forgot to enter a username!"
    elsif params[:password].strip == ""
      message = "You forgot to enter a password!"
    else
      # if username does not exist, create a new user
      if !User.find_by(username: params[:username])
        if User.create(
          username: params[:username],
          password_digest: BCrypt::Password.create(params[:password])
        )
          message = "Your account has been created and you're signed in!"
          sign_in
        else
          # ask if this message is useless in this particular context - will either create user or say wrong password
          message = "Your account couldn't be created. Did you enter a unique username and password?"
        end
      else
        # check password
        decoded_hash = BCrypt::Password.new(User.find_by(username: params[:username]).password_digest)
        if decoded_hash.is_password?(params[:password]) == false
          message = "Your password's wrong!"
          redirect_to :back
        else
          message = "You're signed in, #{params[:username]}! :)"
          sign_in
        end
      end
    end
    puts "-" * 50
    flash[:sign_in_message] = message

  end

  def signin_prompt

  end

  def signout
    reset_session
    redirect_to root_url
  end

  private

  def sign_in
    cookies[:username] = {
      value: params[:username],
      expires: 100.years.from_now
    }
    session[:is_signed_in] = true
    session[:user] = User.find_by(username: params[:username])
    current_user = session[:user]
    redirect_to posts_path
  end

end
