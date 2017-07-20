class ProveedoresController < ApplicationController

  before_action :set_proveedor, only: [:show, :update, :destroy]

  attr_accessor :categorias

  def index
    @proveedores = Proveedor.all.order(rfc: :desc)

    render json: @proveedores
  end

  def show
    render json: @proveedor
  end

  def by_rfc

=begin
    @servicios = ServiceRequest.where(:user_id => current_user.id, :status => ServiceRequest::ACTIVE).order('request_type_id')

    json = {}
    @servicios.each do |s|
      a = {:id => s.id, :number => s.number, :type => s.request_type_id}
      json[s.request_type_id] = [] if !json[s.request_type_id]
      json[s.request_type_id] << a
    end
=end

    @proveedor = Proveedor.find_by_rfc(params[:rfc]) rescue nil
    if @proveedor  then
      if @proveedor.documentos then
        @proveedor = @proveedor.attributes.merge({documentos:@proveedor.documentos})
      end
    end

    render json: @proveedor
  end

=begin
  def by_rfc2
    @proveedor = Proveedor.find_by_rfc(params[:rfc]) rescue nil
    render json: @proveedor
  end
=end

  def create
    @proveedor = Proveedor.new(proveedor_params)

    if @proveedor.save
      render json: @proveedor, status: :created, location: @proveedor
    else
      render json: @proveedor.errors, status: :unprocessable_entity
    end
  end

  def update
    if @proveedor.update(proveedor_params)
      render json: @proveedor
    else
      render json: @proveedor.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @proveedor.destroy
  end

  private
  def set_proveedor
    @proveedor = Proveedor.find(params[:id]) rescue nil
  end

  # Only allow a trusted parameter "white list" through.
  def proveedor_params
    params.require(:proveedor).permit(:rfc, :password, :password_confirmation, :razon_social)
  end


end
