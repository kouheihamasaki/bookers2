class UsersController < ApplicationController
  
  def new
    @book = Book.new
  end
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path
  end

  def edit
    @user = User.find(params[:id])
    @books = @user.books
  end

 def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
 end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
  def is_matching_login_user
    user_id = params[:id].to_i
    unless user_id == current_user.id
      redirect_to post_images_path
    end
  end


end
