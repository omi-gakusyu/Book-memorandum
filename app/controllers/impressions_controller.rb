class ImpressionsController < ApplicationController
   before_action :require_user_logged_in
   before_action :correct_user, only:[:show, :edit, :update, :destroy, :same_books]
   
  def show
    @impression = Impression.find(params[:id])
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
    @impression = Impression.find(params[:id])
  end

  def update
    @imoression = Impression.find(params[:id])
    if @impression.update(impression_params)
      flash[:success] = '読書備忘録を登録しました。'
      redirect_to root_url
    else
      flash.now[:danger] = '読書備忘録の登録に失敗しました。'
      render :edit
    end
  end

  def destroy
    @impression = Impression.find(params[:id])
    @impression.destroy
    flash[:success] = '備忘録を削除しました。'
    redirect_to root_url
  end
  
  def same_books
    if impression = current_user.impressions.find_by(book_id: params[:book_id])
      @impressions = Impression.where(book_id: params[:book_id]).page(params[:page])
      @book = Book.find(params[:book_id])
    else
      redirect_to root_url
    end
  end
  
  private
    def impression_params
      params.require(:impression).permit(:star, :content, :book_id)
    end
    
    def correct_user
      @impression = current_user.impressions.find_by(id: params[:id])
      unless @impression
        redirect_to root_url
      end
    end
end
