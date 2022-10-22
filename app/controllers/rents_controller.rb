class RentsController < ApplicationController
  def index
    @rents = current_user.rents
  end

  def rents
    @rentsall = Rent.all
  end

  def show
    @rent = Rent.find(params[:id])
  end

  def create
    @rent = Rent.new(rents_params)
    @book = Book.find(params[:book_id])
    @rent.book = @book
    @rent.user = current_user
    if @rent.save
      redirect_to book_path(@book)
    else
      redirect_to root_path
    end
  end

  def edit
    @rent = Rent.find(params[:id])
  end

  def update
    @rent = Rent.find(params[:id])
    if @rent.update(rents_params)
      redirect_to rent_path(@rent)
    else
      render :edit
    end
  end

  def destroy
    @rent = Rent.find(params[:id])
    @rent.destroy
    redirect_to book_path(@rent.book), status: :see_other
  end

  private

  def rents_params
    params.require(:rent).permit(:started_at, :end_at, :user_id, :book_id)
  end
end
