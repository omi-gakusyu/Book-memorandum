class ImpressionsController < ApplicationController
   before_action :require_user_logged_in
   
  def show
  end

  def new
    @impressions = Impression.new
    @book= Book.find_by(isbn: params[:isbn])
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
