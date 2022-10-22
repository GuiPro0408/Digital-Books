class BooksController < ApplicationController
  before_action :set_book, only: %i[show content]
  def content
    @content = @book.content
    @existed_rent = Rent.where(user_id: current_user.id, book_id: @book).exists?
  end

  def index
    @books = Book.all
  end

  def show
    @rent = Rent.new(book_id: @book)
    @review = Review.new(book_id: @book)
    # Si current_user so ID trouve dans rents lerla et si sa book ki nou eter currently la so ID li ici li trouve dan rents lerla li paraitre
    # Current_user.id
    # Book.id
    @existed_review = Review.find_by(user_id: current_user.id, book_id: @book)
    @existed_rent = Rent.find_by(user_id: current_user.id, book_id: @book)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book)
    else
      render "new", status: :unprocessable_entity
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :overview, :author, :category, :content, :poster_url, :price_per_day)
  end
end
