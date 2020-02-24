class BooksController < ApplicationController
  protect_from_forgery #show.htmlのPOSTリクエストを許可する為
  
  def new
    @book = Book.new
    @book.impressions.build
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = "読書備忘録を登録しました。"
      redirect_to root_url
    else
      flash.now[:danger] = "読書備忘録の登録に失敗しました。"
      render :new
    end
  end

  def search
    @book= Book.find_by(isbn: params[:isbn])
    if @book
      redirect_to new_impression_path(isbn: @book.isbn)
    else
      redirect_to new_book_path
    end
  end
  
  private
    def book_params
      params.require(:book).permit(:title, :writer, :isbn, :image, impressions_attributes: [:star, :content, :user_id])
    end
  
end
