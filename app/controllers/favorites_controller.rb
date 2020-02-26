class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    impression = Impression.find(params[:impression_id])
    current_user.favorite(impression)
    flash[:success] = 'お気に入りに登録しました。'
    redirect_to root_url
  end

  def destroy
    impression = Impression.find(params[:impression_id])
    current_user.unfavorite(impression)
    flash[:success] = 'お気に入りを解除しました。'
    redirect_to root_url
  end
end
