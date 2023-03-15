class BooksController < ApplicationController

  def create
    @books = Book.all
    @book = Book.new(book_params)
   if @book.save
      flash[:notice] = "投稿が成功しました"
    redirect_to book_path(@book.id)
   else
    render :index
   end
  end

  def update
    @book = Book.find(params[:id])
    flash[:notice] = "投稿が成功しました"
   if @book.update(book_params)
    redirect_to book_path(@book.id)
   else
    render :edit
   end
  end


  def top
  end

  def destroy
     book = Book.find(params[:id])
     book.destroy
     redirect_to '/books'
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end


  def edit
     @book = Book.find(params[:id])
  end


  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
