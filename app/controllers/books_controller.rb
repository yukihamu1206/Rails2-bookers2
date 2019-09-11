class BooksController < ApplicationController

  before_action :authenticate_user!, only: [:edit, :update, :destroy, :index, :show]
  before_action :correct_user, only: [:edit, :update]


  def new
    @post_book = Book.new
    @books = Book.all
    @user = User.find(current_user.id)
  end

  def create
    @user = User.find(current_user.id)
    @post_book = Book.new(book_params)
    @post_book.user_id = current_user.id
    if @post_book.save
      flash[:notice] = "successfully"
    redirect_to "/books/#{@post_book.id}"
    else
      @books = Book.all
    render :index
  end
  end
 
  def show
    @post_book = Book.new
    @books = Book.all
    @book = Book.find(params[:id])

    @user = User.find(current_user.id)

  end

  def index
    @books = Book.all
    @post_book = Book.new
    @user = User.find(current_user.id)
  end


  def edit
    @post_book = Book.find(params[:id])
    @user = User.find(current_user.id)
  end

  def update
    @post_book = Book.find(params[:id])
    if @post_book.update(book_params)
      flash[:notice] = "successfully"
     redirect_to book_path(@post_book.id)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(current_user.id)
    @post_book = Book.find(params[:id])
    @post_book.destroy
    redirect_to books_path
  end

  private

  def book_params
  params.require(:book).permit(:title, :body)
  end

  def correct_user
  @book = current_user.books.find_by(id: params[:id])
    unless @book
      redirect_to books_path
    end
  end


end

