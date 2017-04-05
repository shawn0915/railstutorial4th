class PasswordResetsController < ApplicationController
  def new
  end

  def create
    @users = User.find_by(email: params[:password_reset][:email].downcase)
    if @users
      @users.create_reset_digest
      @users.send_password_reset_email
      flash[:info] = "Email sent with password reset instructions"
      redirect_to root_url
    else
      flash.now[:danger] = "Email address not found"
      render 'new'
    end
  end

  def edit
  end
end
