class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def create
    byebug
    book = Book.create(book_params)
    if book.valid?
      redirect_to root_path
    else
      @error = 'something went wrong'
      render @books
    end
  end

  private

  def book_params 
    params.require(:book).permit(:author, :title)
  end
end
