class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    # debugger
  end

  def create
    # @user = User.new(params[:@user]) # 不是最终的实现方式
    @user = User.new(user_params)
    if @user.save
      # 处理注册成功的情况

      # 闪现消息
      flash[:success] = "Welcome to the Sample App!"
      # flash[:info] = "Please check your email to activate your account."

      # 重定向
      redirect_to @user
      # 等同于
      # redirect_to user_url(@user)
      # redirect_to root_url
    else
      render 'new'
    end
  end

  # 私有方法
  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

end
