class BooksController < ApplicationController
  def new
  end

  def create
  end

  def search
    @book= Book.find_by(isbn: params[:isbn])
    if @book
      redirect_to new_impression_path(book_isbn: @book.isbn)
    else
      redirect_to new_impression_path
    end
  end
end
