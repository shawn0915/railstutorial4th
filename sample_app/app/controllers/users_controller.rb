class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def index
    # @users = User.all
    @users = User.paginate(page: params[:page])
  end

  def new
    @users = User.new
  end

  def show
    @users = User.find(params[:id])
    # debugger
  end

  def create
    # @users = User.new(params[:@users]) # 不是最终的实现方式
    @users = User.new(user_params)
    if @users.save
      # 处理注册成功的情况

      # 注册后登入用户
      log_in @users

      # 闪现消息
      flash[:success] = "Welcome to the Sample App!"
      # flash[:info] = "Please check your email to activate your account."

      # 重定向
      redirect_to @users
      # 等同于
      # redirect_to user_url(@users)
      # redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @users = User.find(params[:id])
  end

  def update
    @users = User.find(params[:id])
    # user_params -- 健壮参数（strong parameter）
    if @users.update_attributes(user_params)
      # 处理更新成功的情况
      flash[:success] = "Profile updated"
      redirect_to @users
    else
      render 'edit'
    end
  end

  # 私有方法
  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  # 前置过滤器

  # 确保用户已登录
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  # 确保是正确的用户
  def correct_user
    @users = User.find(params[:id])
    # redirect_to(root_url) unless @users == current_user
    redirect_to(root_url) unless current_user?(@users)
  end

end
