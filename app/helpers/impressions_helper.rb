module ImpressionsHelper
  def book_exist?
    if @book= Book.find_by(isbn: params[:isbn])
      return true
    else
      return false
    end
  end
end
