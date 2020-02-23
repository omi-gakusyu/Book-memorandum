class ImpressionsController < ApplicationController
   before_action :require_user_logged_in
   
  def show
  end

  def new
    @impression = Impression.new
  end

  def create
    @impression = current_user.impressions.build(impression_params)
    if @impression.save
      flash[:success] ='読書備忘録を登録しました。'
      redirect_to root_url
    else
      @book = Book.find(impression_params[:book_id])
      flash[:danger] ='読書備忘録の登録に失敗しました。'
      redirect_to new_impression_path(isbn: @book.isbn)
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
    def impression_params
      params.require(:impression).permit(:star, :content, :book_id)
    end
    
end
