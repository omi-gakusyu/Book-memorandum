class ApplicationController < ActionController::Base
  
  include SessionsHelper
  include ImpressionsHelper
  
  private
  
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def counts(user)
    @count_impressions = Impression.where(user_id: user).count
    @count_favorites = Favorite.where(user_id: user).count
  end
  
end
