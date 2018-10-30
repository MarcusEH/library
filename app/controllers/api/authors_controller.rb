class Api::AuthorsController < ApplicationController
  def index
    @authors = Author.all
    render 'index.json.jbuilder'
  end

  def show
    @author = Author.find_by(id: params[:id])
    render 'show.json.jbuilder'
  end

  def create
    @author = Author.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email]
    )
    @author.save
    if @author.save
      render 'show.json.jbuilder'
    else
      render json: {message: "cannot save this author"}
    end
  end
  def update
    @author = Author.find_by(id: params[:id])
    @author.first_name = params[:first_name] || @author.first_name
    @author.last_name = params[:last_name] || @author.last_name
    @author.email = params[:email] || @author.email
    @author.save
    if @author.save
      render 'show.json.jbuilder'
    else
      render json: {message: "this author cannot be saved"}
    end
  end
  def destroy
    @author = Author.find_by(id: params[:id])
    @author.destroy
    render json: {message: "you have successfully deleted this author"}
  end
end
