class DocumentosController < ApplicationController

  def index
    @documentos = Documento.all
    render json: @documentos
  end

  def show
    @documento = Documento.find(params[:id]) rescue nil
    render json: @documento
  end

  def by_proveedor_id
    @documentos = Documento.where(["proveedor_id = #{:proveedor_id}"]) rescue nil
    render json: @documentos
  end

  def new
    @documento = Documento.new
  end

  def create

    @documento = Documento.new

    @documento.categoria_id = documento_params[:categoria_id] rescue 1
    proveedor_id = documento_params[:proveedor_id] rescue 1 # el 1 es un default (yo mismo CAOJ710319)
    @documento.proveedor = Proveedor.find(proveedor_id)
    @documento.attachment = documento_params[:attachment]
    @documento.file = @documento.attachment.filename
    @documento.orden_compra = documento_params[:orden_compra].upcase rescue 'SIN-OC'

    begin
      @documento.save!
#      redirect_to documentos_path, notice: "The documento #{@documento.file} has been uploaded."
      render "created"
    rescue => ex
      puts 'EROROROROORRO'
      puts ex.message
      render "new"
    end

=begin
    if @documento.save
      redirect_to documentos_path, notice: "The documento #{@documento.file} has been uploaded."
    else
      render "new"
    end
=end

  end

  def destroy
    @documento = Documento.find(params[:id])
    @documento.destroy
    FileUtils.remove_dir("#{Rails.root}/public#{@documento.attachment.url}", :force => true)
  end


  def download
    @documento = Documento.find(params[:id]) rescue nil
    url_path = "http://localhost:3000/#{@documento.attachment.url}"
    data = open(url_path).read
    send_data data, :disposition => 'attachment', :filename => @documento.file
  end

  def categorias
    render json: Categoria.all
  end

  private
  def documento_params
    params.require(:documento).permit(:attachment, :proveedor_id, :categoria_id, :orden_compra)
  end

end

