class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    @user = current_user
    @books = Book.all
    if @book.save
     flash[:notice] = "successfully"
     redirect_to book_path(@book.id)
    else
     render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
    unless @book.user_id == current_user.id
    redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    @book.save
    @user = current_user
    @books = Book.all
    @book.update(book_params)
    if @book.save
     flash[:notice] = "successfully"
     redirect_to book_path(@book.id)
    else
     render :index
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  def show
    @user = current_user
    @books = @user.books
    @book = Book.new
    @book_find = Book.find(params[:id])
    @user_find = @book_find.user
  end




  # ストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
