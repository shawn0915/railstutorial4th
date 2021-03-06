class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    # 用户存在 && 密码正确
    if user && user.authenticate(params[:session][:password])
      # 禁止未激活的用户登录
      if user.activated?
        # 调用辅助方法
        log_in user
        # 记住登录状态
        # remember user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        # 登入用户，然后重定向到用户的资料页面
        # redirect_to user
        # 友好跳转
        redirect_back_or user
      else
        message = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end
    else
      # 创建一个错误消息
      # flash[:danger] = 'Ivalid email/password combination' # 不完全正确
      flash.now[:danger] = 'Ivalid email/password combination'

      render 'new'
    end

  end

  def destory
    log_out if logged_in?
    redirect_to root_url
  end
end
