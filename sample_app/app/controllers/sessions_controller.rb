class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    # 用户存在 && 密码正确
    if user && user.authenticate(params[:session][:password])
      # 登入用户，然后重定向到用户的资料页面

    else
      # 创建一个错误消息
      # flash[:danger] = 'Ivalid email/password combination' # 不完全正确
      flash.now[:danger] = 'Ivalid email/password combination'

      render 'new'
    end

  end

  def destory

  end
end
