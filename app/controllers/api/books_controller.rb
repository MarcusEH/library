class Api::BooksController < ApplicationController
  def index
    @books = Book.all
    render 'index.json.jbuilder'
  end

  def show
    @book = Book.find_by(id: params[:id])

    render 'show.json.jbuilder'
  end

  def create
    @book = Book.new(
      title: params[:title],
      genre: params[:genre],
      author_id: params[:author_id],
      description: params[:description]
    )
    @book.save
    if @book.save
      render 'show.json.jbuilder'
    else
      render json: {message: "cannot save this book"}
    end
  end

  def update
    @book = Book.find_by(id: params[:id])
    @book.title = params[:title] || @book.title
    @book.genre = params[:genre] || @book.genre
    @book.author_id = params[:author_id] || @book.author_id
    @book.description = params[:description] || @book.description
    @book.save
    if @book.save
      render 'show.json.jbuilder'
    else
      render json: {message: "your book cannot be saved"}
    end
  end

  def destroy
    @book = Book.find_by(id: params[:id])
    @book.destroy
    render json: {message: "you have successfully destroyed this book"}
  end
end
