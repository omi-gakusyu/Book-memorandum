class BooksController < ApplicationController
  def new
  end

  def create
  end

  def search
    @book= Book.find_by(isbn: params[:isbn])
    redirect_to new_impression_path
  end
end
