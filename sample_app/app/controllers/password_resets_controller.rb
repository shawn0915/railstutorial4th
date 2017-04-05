class PasswordResetsController < ApplicationController
  before_action :get_user, only: [:edit, :update]
  before_action :valid_user, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update] # 第一种情况

=begin
Update的四种情况：
  1. 密码重设请求已过期
  2. 填写的新密码无效，更新失败
  3. 没有填写密码和密码确认，更新失败（看起来像是成功了）
  4. 成功更新密码
=end

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

  def update
    if params[:user][:password].empty? # 第三种情况
      @users.errors.add(:password, "can't be empty")
      render 'edit'
    elsif @users.update_attributes(user_params) # 第四种情况
      log_in @users
      # 成功重设密码后清除重设摘要
      @users.update_attributes(:reset_digest, nil)
      flash[:success] = "Password has been reset."
      redirect_to @users
    else
      render 'edit' # 第二种情况
    end
  end

  private

  def get_user
    @users = User.find_by(email: params[:email])
  end

  # 确保是有效用户
  def valid_user
    unless (@users && @users.activated? &&
        @users.authenticated?(:reset, params[:id]))
      redirect_to root_url
    end
  end

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  # 检查重设令牌是否过期
  def check_expiration
    if @users.password_reset_expired?
      flash[:danger] = "Password reset has expired."
      redirect_to new_password_reset_url
    end
  end

end
