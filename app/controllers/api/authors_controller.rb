class Api::AuthorsController < ApplicationController
  def index
    @authors = Author.all
    render 'index.json.jbuilder'
  end

  def show
    @author = Author.find_by(id: params[:id])
    render 'show.json.jbuilder'
  end
end
