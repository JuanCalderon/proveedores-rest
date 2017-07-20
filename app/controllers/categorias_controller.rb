class CategoriasController < ApplicationController
  def index
    render json: Categoria.all
  end
end