class ReviewsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @review = Review.new(review_params)
    @review.book = @book
    @review.user = current_user
    if @review.save
      redirect_to book_path(@book)
    else
      @rent = Rent.new
			render "books/show", status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to book_path(@review.book), status: :see_other
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
