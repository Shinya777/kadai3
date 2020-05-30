class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :index]
  before_action :correct_user, only: [:edit]

  def index
  end
  # マイページ作成
  def show
  	@user = User.find(params[:id])
    @book = Book.new
    @books = @user.books 
  end
  
  def index
    @user = current_user
    @book = Book.new
    @users = User.all
  end

  def edit
  	@user = current_user
    
  end

  def update
  	@user = User.find(params[:id])
  	# ここからif notice追加else renderも
    if @user.update(user_params)
  	redirect_to user_path(@user.id),notice:'You have updated user successfully.'
  else
     render :edit
  end
  end
  
private
  def user_params
	params.require(:user).permit(:name, :profile_image, :introduction)	
  end
 def correct_user
  @user = User.find(params[:id])
  if @user != current_user
    redirect_to user_path(current_user)
  end
end
end

