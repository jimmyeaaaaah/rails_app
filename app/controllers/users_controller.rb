class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:edit, :update]}
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
  before_action :ensure_correct_user, {only: [:edit, :update]}

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]
    @user.date = params[:password]
    @user.gender = params[:gender]
    @user.image_name = "default.png"
    if @user.save
      flash[:notice] = "ユーザー登録が完了しました"
      session[:user_id] = @user.id
      redirect_to("/")
    else
      render("/users/new")
    end
  end

  def login_form
  end


  def login
    @user = User.find_by(email: params[:email])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to("/")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end
  end


  def logout
    session[:user_id] = nil
    redirect_to("/")
  end


  def mypage
    @user = User.find_by(id: params[:id])
    @my_posts = Post.where(user_id: params[:id]).order(created_at: :desc)
  end


  def edit
    @user = User.find_by(id: params[:id])
  end


  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]
    @user.date = params[:password]
    @user.gender = params[:gender]

    if params[:image]
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    end

    if @user.save
      flash[:notice] = "プロフィールを変更しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end
  end
end
